import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

import 'package:gravity/consts.dart';
import 'package:gravity/data/service/preference_service.dart';
import 'package:gravity/ui/utils/ferry_utils.dart';

typedef JWT = ({String subject, String accessToken, int expiresIn});

class AuthRepository {
  static const _jwtHeader = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.';
  static const _emptyJWT = (subject: '', accessToken: '', expiresIn: 0);

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

  late final ed.KeyPair _keyPair;

  JWT _jwt = _emptyJWT;

  String get myId => _jwt.subject;

  bool get isAuthenticated => _jwt != _emptyJWT;

  Future<AuthRepository> init() async {
    final seed = await _preferences.get<Uint8List>(PreferencesKeys.keySeed);
    if (seed == null) {
      _keyPair = ed.generateKey();
      await register();
    } else {
      final privateKey = ed.newKeyFromSeed(seed);
      _keyPair = ed.KeyPair(privateKey, ed.public(privateKey));
      await _fetchAuthToken('login');
    }
    return this;
  }

  Future<void> dispose() async {
    await freshLink.dispose();
  }

  Future<void> register() async {
    await _fetchAuthToken('register');
    await _preferences.set(
      PreferencesKeys.keySeed,
      ed.seed(_keyPair.privateKey),
    );
  }

  Future<void> signIn() => _fetchAuthToken('login');

  Future<void> signOut() async {
    _jwt = _emptyJWT;
    await freshLink.clearToken();
  }

  Future<void> deleteAccount() async {
    await signOut();
  }

  Future<JWT> _fetchAuthToken(String intent) async {
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
      Uri.https(appLinkBase, 'user/$intent'),
      headers: {
        'Authorization': 'Bearer $_jwtHeader$body.$signature',
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map;
      _jwt = (
        subject: body['subject'] as String,
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
