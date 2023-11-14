import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

typedef JWT = ({String id, String accessToken, int expiresIn});

class AuthenticationRepository {
  static const _jwtHeader = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.';

  AuthenticationRepository({
    required this.serverName,
    required Uint8List seed,
  }) : _seed = seed {
    final privateKey = ed.newKeyFromSeed(seed);
    _keyPair = ed.KeyPair(privateKey, ed.public(privateKey));
  }

  AuthenticationRepository.seed({
    required this.serverName,
  }) {
    _keyPair = ed.generateKey();
    _seed = ed.seed(_keyPair.privateKey);
  }

  final String serverName;

  late final Uint8List _seed;
  late final ed.KeyPair _keyPair;

  JWT? _jwt;

  JWT? get jwt => _jwt;

  Uint8List get seed => _seed;

  Future<JWT> signIn() => _fetchAuthToken('user/login');

  Future<JWT> signUp() => _fetchAuthToken('user/register');

  // TBD: invalidate jwt
  Future<void> signOut() async {
    _jwt = null;
  }

  // TBD
  Future<void> delete() async {
    _jwt = null;
  }

  String _createToken() {
    final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
    final body = base64UrlEncode(utf8.encode(jsonEncode({
      'pk': base64UrlEncode(_keyPair.publicKey.bytes).replaceAll('=', ''),
      'iat': now,
      'exp': now + 3600,
      // TBD: uuid for jwt invalidation on logout
      'jti': '',
    }))).replaceAll('=', '');
    final signature = base64UrlEncode(ed.sign(
      _keyPair.privateKey,
      Uint8List.fromList(utf8.encode(_jwtHeader + body)),
    )).replaceAll('=', '');
    return '$_jwtHeader$body.$signature';
  }

  Future<JWT> _fetchAuthToken(String path) async {
    final response = await http.post(
      Uri.https(serverName, path),
      headers: {
        'Authorization': 'Bearer ${_createToken()}',
      },
    );
    switch (response.statusCode) {
      case 200:
        final body = jsonDecode(response.body) as Map;
        _jwt = (
          id: body['subject'] as String,
          accessToken: body['access_token'] as String,
          expiresIn: body['expires_in'] as int,
        );
        return _jwt!;
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
}

sealed class AuthenticationException implements Exception {
  const AuthenticationException([this.description]);

  final String? description;
}

final class AuthenticationHttpException extends AuthenticationException {
  const AuthenticationHttpException([
    super.description = 'General HTTP error.',
  ]);
}

final class AuthenticationFailedException extends AuthenticationException {
  const AuthenticationFailedException([
    super.description = 'Authorization failed. Wrong token',
  ]);
}

final class AuthenticationNotFoundException extends AuthenticationException {
  const AuthenticationNotFoundException([
    super.description = 'Authorization failed. User not found',
  ]);
}

final class AuthenticationDuplicatedException extends AuthenticationException {
  const AuthenticationDuplicatedException([
    super.description = 'Authorization failed. User registered already',
  ]);
}

final class AuthenticationServerException extends AuthenticationException {
  const AuthenticationServerException([
    super.description = 'Internal server error.',
  ]);
}
