import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

import 'package:tentura/consts.dart';

import '../domain/exception.dart';

export 'package:get_it/get_it.dart';

class AuthRepository {
  static const _jwtHeader = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.';

  AuthRepository({
    String serverName = appLinkBase,
  }) : _serverName = serverName;

  final String _serverName;

  late final link = FreshLink.oAuth2(
    tokenStorage: InMemoryTokenStorage(),
    tokenHeader: (token) => {
      'Authorization': 'Bearer ${token!.accessToken}',
    },
    refreshToken: (token, client) async {
      final jwt = await _fetchJWT('user/login');
      return OAuth2Token(
        accessToken: jwt.accessToken,
        expiresIn: jwt.expiresIn,
      );
    },
    shouldRefresh: (response) => response.errors != null,
  );

  late ed.KeyPair _keyPair;

  Future<void> close() async {
    await link.dispose();
  }

  Future<String> signIn(String seed) async {
    final privateKey = ed.newKeyFromSeed(base64Decode(seed));
    _keyPair = ed.KeyPair(privateKey, ed.public(privateKey));

    final jwt = await _fetchJWT('user/login');
    await link.setToken(OAuth2Token(
      accessToken: jwt.accessToken,
      expiresIn: jwt.expiresIn,
    ));
    return jwt.id;
  }

  Future<({String id, String seed})> signUp() async {
    _keyPair = ed.generateKey();
    final jwt = await _fetchJWT('user/register');
    await link.setToken(OAuth2Token(
      accessToken: jwt.accessToken,
      expiresIn: jwt.expiresIn,
    ));
    return (
      id: jwt.id,
      seed: base64UrlEncode(ed.seed(_keyPair.privateKey)),
    );
  }

  // TBD: invalidate jwt on remote server also
  Future<void> signOut() async {
    await link.clearToken();
  }

  // TBD: remove account on remote server
  Future<void> delete() async {
    await link.clearToken();
  }

  Future<({String id, String accessToken, int expiresIn})> _fetchJWT(
    String path,
  ) async {
    final response = await http.post(
      Uri.https(_serverName, path),
      headers: {
        'Authorization': 'Bearer ${_createAuthRequestToken()}',
      },
    );
    switch (response.statusCode) {
      case 200:
        final body = jsonDecode(response.body) as Map;
        return (
          id: body['subject'] as String,
          expiresIn: body['expires_in'] as int,
          accessToken: body['access_token'] as String,
        );
      case 401:
        throw const AuthenticationFailedException();
      case 404:
        throw const AuthenticationNotFoundException();
      case 409:
        throw const AuthenticationDuplicatedException();
      case 502:
        throw const AuthenticationServerException();
      default:
        throw AuthenticationHttpException(response.reasonPhrase);
    }
  }

  String _createAuthRequestToken() {
    final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
    final body = base64UrlEncode(utf8.encode(jsonEncode({
      'pk': base64UrlEncode(_keyPair.publicKey.bytes).replaceAll('=', ''),
      'iat': now,
      'exp': now + jwtExpiresIn.inSeconds,
      // TBD: uuid for jwt invalidation on logout
      'jti': '',
    }))).replaceAll('=', '');
    final signature = base64UrlEncode(ed.sign(
      _keyPair.privateKey,
      Uint8List.fromList(utf8.encode(_jwtHeader + body)),
    )).replaceAll('=', '');
    return '$_jwtHeader$body.$signature';
  }
}
