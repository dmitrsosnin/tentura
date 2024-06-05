import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart';

import 'exception.dart';

export 'package:ed25519_edwards/ed25519_edwards.dart' show KeyPair;

class TokenService {
  static const _jwtHeader = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.';

  const TokenService({
    required this.serverName,
    required this.jwtExpiresIn,
  });

  final String serverName;
  final Duration jwtExpiresIn;

  Future<KeyPair> generateKeyPair() => Isolate.run(generateKey);

  Future<String> seedFromKeyPair(KeyPair keyPair) =>
      Isolate.run(() => base64UrlEncode(seed(keyPair.privateKey)));

  Future<KeyPair> keyPairFromSeed(String seed) => Isolate.run(() {
        final privateKey = newKeyFromSeed(base64Decode(seed));
        return KeyPair(privateKey, public(privateKey));
      });

  Future<({String id, String accessToken, int expiresIn})> fetchJWT({
    required KeyPair keyPair,
    required String path,
  }) async {
    final response = await post(
      Uri.https(serverName, path),
      headers: {
        'Authorization': 'Bearer ${_createAuthRequestToken(keyPair)}',
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

  String _createAuthRequestToken(KeyPair keyPair) {
    final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
    final body = base64UrlEncode(utf8.encode(jsonEncode({
      'pk': base64UrlEncode(keyPair.publicKey.bytes).replaceAll('=', ''),
      'iat': now,
      'exp': now + jwtExpiresIn.inSeconds,
      // TBD: uuid for jwt invalidation on logout
      'jti': '',
    }))).replaceAll('=', '');
    final signature = base64UrlEncode(sign(
      keyPair.privateKey,
      Uint8List.fromList(utf8.encode(_jwtHeader + body)),
    )).replaceAll('=', '');
    return '$_jwtHeader$body.$signature';
  }
}
