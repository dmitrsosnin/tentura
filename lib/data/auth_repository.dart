import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

import 'package:gravity/data/service/preference_service.dart';
import 'package:gravity/ui/ferry_utils.dart';

typedef JWT = ({String subject, String accessToken, int expiresIn});

class AuthRepository {
  static const _jwtHeader = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.';

  final preferences = GetIt.I<PreferencesService>();

  late final freshLink = FreshLink.oAuth2(
    tokenStorage: InMemoryTokenStorage(),
    tokenHeader: (token) => {
      'Authorization': 'Bearer ${token?.accessToken}',
    },
    refreshToken: (token, client) async {
      _jwt = await _fetchAuthToken('login');
      return _jwt == null
          ? null
          : OAuth2Token(
              accessToken: _jwt!.accessToken,
              expiresIn: _jwt!.expiresIn,
            );
    },
    shouldRefresh: (response) => response.errors != null,
  );

  late final ed.KeyPair _keyPair;

  JWT? _jwt;

  String get myId => _jwt?.subject ?? '';

  bool get isAuthenticated => _jwt != null;

  Future<AuthRepository> init() async {
    final seed = await preferences.get<Uint8List>(PreferencesKeys.keySeed);

    if (seed == null) {
      _keyPair = ed.generateKey();
      await register();
    } else {
      final privateKey = ed.newKeyFromSeed(seed);
      _keyPair = ed.KeyPair(privateKey, ed.public(privateKey));
      _jwt = await _fetchAuthToken('login');
    }

    if (_jwt != null) {
      await freshLink.setToken(OAuth2Token(
        accessToken: _jwt!.accessToken,
        expiresIn: _jwt!.expiresIn,
      ));
    }

    return this;
  }

  Future<bool> register() async {
    _jwt = await _fetchAuthToken('register');
    if (_jwt != null) {
      await preferences.set(
        PreferencesKeys.keySeed,
        ed.seed(_keyPair.privateKey),
      );
      await freshLink.setToken(OAuth2Token(
        accessToken: _jwt!.accessToken,
        expiresIn: _jwt!.expiresIn,
      ));
    }
    return isAuthenticated;
  }

  Future<bool> signIn() async {
    _jwt = await _fetchAuthToken('login');
    await freshLink.setToken(OAuth2Token(
      accessToken: _jwt!.accessToken,
      expiresIn: _jwt!.expiresIn,
    ));
    return isAuthenticated;
  }

  Future<void> signOut() async {}

  Future<void> deleteAccount() async {}

  Future<JWT?> _fetchAuthToken(String intent) async {
    final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
    final body = base64UrlEncode(utf8.encode(jsonEncode({
      'pk': base64UrlEncode(_keyPair.publicKey.bytes).replaceAll('=', ''),
      'iat': now,
      'exp': now + 3600,
    }))).replaceAll('=', '');
    final signature = base64UrlEncode(ed.sign(
      _keyPair.privateKey,
      Uint8List.fromList(utf8.encode(_jwtHeader + body)),
    )).replaceAll('=', '');
    final response = await http.post(
      Uri.https('hasura.gravity.intersubjective.space', 'user/$intent'),
      headers: {
        'Authorization': 'Bearer $_jwtHeader$body.$signature',
      },
    );
    if (response.statusCode == 200) {
      final jwt = jsonDecode(response.body) as Map;
      return (
        subject: jwt['subject'] as String,
        accessToken: jwt['access_token'] as String,
        expiresIn: jwt['expires_in'] as int,
      );
    }
    return null;
  }
}
