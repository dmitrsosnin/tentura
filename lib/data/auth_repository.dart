import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

import 'package:gravity/consts.dart';
import 'package:gravity/data/service/preference_service.dart';
import 'package:gravity/ui/utils/ferry_utils.dart';

typedef JWT = ({String id, String accessToken, int expiresIn});

class AuthRepository {
  static const _jwtHeader = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.';
  static const _emptyJWT = (id: '', accessToken: '', expiresIn: 0);

  late final freshLink = FreshLink.oAuth2(
    tokenStorage: InMemoryTokenStorage(),
    tokenHeader: (token) => {
      'Authorization': 'Bearer ${token?.accessToken}',
    },
    refreshToken: (_, __) => _fetchAuthToken('login').then(
      (jwt) => OAuth2Token(
        accessToken: jwt.accessToken,
        expiresIn: jwt.expiresIn,
      ),
    ),
    shouldRefresh: (response) => response.errors != null,
  );

  final _preferences = GetIt.I<PreferencesService>();

  final _accounts = <String, String>{};

  JWT _jwt = _emptyJWT;

  ed.KeyPair? _keyPair;

  String get myId => _jwt.id;

  bool get isAuthenticated => _jwt.id.isNotEmpty;

  Iterable<String> get accounts => _accounts.keys;

  String? getSeed(String id) => _accounts[id];

  Future<AuthRepository> init() async {
    final accounts = await _preferences.get<String>(PreferencesKeys.kAccounts);
    if (accounts != null && accounts.isNotEmpty) {
      (jsonDecode(accounts) as Map<String, dynamic>)
          .forEach((key, value) => _accounts[key] = value as String);
    }

    final id = await _preferences.get<String>(PreferencesKeys.kCurrentId);
    if (id != null && id.isNotEmpty) await signIn(id);

    return this;
  }

  Future<void> dispose() async {
    await freshLink.dispose();
  }

  Future<void> addAccount(String seed) async {
    if (_accounts.values.contains(seed)) throw const SeedExistsException();
    try {
      final privateKey = ed.newKeyFromSeed(base64Decode(seed));
      _keyPair = ed.KeyPair(privateKey, ed.public(privateKey));
      _jwt = await _fetchAuthToken('login');
    } catch (e) {
      _jwt = _emptyJWT;
      _keyPair = null;
      rethrow;
    }
    _accounts[_jwt.id] = seed;
    await _saveAccounts();
    await _saveCurrentId();
    if (kDebugMode) print(_accounts[_jwt.id]);
  }

  Future<void> createAccount() async {
    try {
      _keyPair = ed.generateKey();
      _jwt = await _fetchAuthToken('register');
    } catch (e) {
      _keyPair = null;
      _jwt = _emptyJWT;
      rethrow;
    }
    _accounts[_jwt.id] = base64UrlEncode(ed.seed(_keyPair!.privateKey));
    await _saveAccounts();
    await _saveCurrentId();
    if (kDebugMode) print(_accounts[_jwt.id]);
  }

  Future<void> signIn(String id) async {
    try {
      final privateKey = ed.newKeyFromSeed(base64Decode(_accounts[id]!));
      _keyPair = ed.KeyPair(privateKey, ed.public(privateKey));
      _jwt = await _fetchAuthToken('login');
    } catch (e) {
      _keyPair = null;
      _jwt = _emptyJWT;
      rethrow;
    }
    await _saveCurrentId();
    if (kDebugMode) print(_accounts[_jwt.id]);
  }

  Future<void> signOut() async {
    _keyPair = null;
    _jwt = _emptyJWT;
    await freshLink.clearToken();
    await _preferences.delete(PreferencesKeys.kCurrentId);
  }

  Future<void> removeAccount(String id) async {
    _accounts.remove(id);
    await _saveAccounts();
  }

  // TBD: remove from server
  Future<void> deleteAccount(String id) async {
    _accounts.remove(id);
    await _saveAccounts();
    await signOut();
  }

  Future<void> _saveAccounts() => _preferences.set<String>(
        PreferencesKeys.kAccounts,
        jsonEncode(_accounts),
      );

  Future<void> _saveCurrentId() => _preferences.set<String>(
        PreferencesKeys.kCurrentId,
        _jwt.id,
      );

  Future<JWT> _fetchAuthToken(String intent) async {
    final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
    final body = base64UrlEncode(utf8.encode(jsonEncode({
      'pk': base64UrlEncode(_keyPair!.publicKey.bytes).replaceAll('=', ''),
      'iat': now,
      'exp': now + 3600,
    }))).replaceAll('=', '');
    final signature = base64UrlEncode(ed.sign(
      _keyPair!.privateKey,
      Uint8List.fromList(utf8.encode(_jwtHeader + body)),
    )).replaceAll('=', '');
    final response = await http.post(
      Uri.https(appLinkBase, 'user/$intent'),
      headers: {
        'Authorization': 'Bearer $_jwtHeader$body.$signature',
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map;
      _jwt = (
        id: body['subject'] as String,
        accessToken: body['access_token'] as String,
        expiresIn: body['expires_in'] as int,
      );
      await freshLink.setToken(OAuth2Token(
        accessToken: _jwt.accessToken,
        expiresIn: _jwt.expiresIn,
      ));
      return _jwt;
    }
    throw Exception('AuthRepository: ${response.reasonPhrase}');
  }
}

class SeedExistsException implements Exception {
  const SeedExistsException();
}
