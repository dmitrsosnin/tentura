import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart';
import 'package:tentura_sdk/client/message.dart';

import '../exception.dart';

typedef JWT = ({String id, String accessToken, DateTime expiresAt});

/// Set KeyPair before fetchJWT
class TokenService {
  static const _jwtHeader = 'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.';

  TokenService({
    required this.serverName,
    required this.jwtExpiresIn,
  });

  final String serverName;
  final Duration jwtExpiresIn;

  JWT? _jwt;

  KeyPair? _keyPair;

  bool _tokenLocked = false;

  /// Generate and set new KeyPair and returns its seed
  Future<String> setNewKeyPair() async {
    _keyPair = await Isolate.run(generateKey);
    return Isolate.run(() => base64UrlEncode(seed(_keyPair!.privateKey)));
  }

  Future<void> setKeyPairFromSeed(String seed) async {
    _keyPair = await Isolate.run(() {
      final privateKey = newKeyFromSeed(base64Decode(seed));
      return KeyPair(privateKey, public(privateKey));
    });
  }

  Future<GetTokenResponse> getToken() async {
    final validTime = DateTime.timestamp().subtract(jwtExpiresIn);

    if (_jwt == null || _jwt!.expiresAt.isBefore(validTime)) {
      if (_tokenLocked) {
        var waitFor = const Duration(milliseconds: 100);
        while (waitFor < jwtExpiresIn) {
          await Future<void>.delayed(waitFor);
          if (_jwt == null) {
            waitFor *= 2;
          } else {
            return GetTokenResponse(value: _jwt!.accessToken);
          }
        }
        return GetTokenResponse(
          error: TimeoutException('Timeout while refreshing token!'),
        );
      } else {
        await signIn();
      }
    }
    return GetTokenResponse(value: _jwt!.accessToken);
  }

  Future<String> signIn() async {
    _jwt = null;
    _tokenLocked = true;
    _jwt = await _fetchJWT('user/login');
    _tokenLocked = false;
    return _jwt!.id;
  }

  Future<String> signUp() async {
    _jwt = null;
    _tokenLocked = true;
    _jwt = await _fetchJWT('user/register');
    _tokenLocked = false;
    return _jwt!.id;
  }

  // TBD: invalidate jwt on remote server also
  Future<void> signOut() async {
    _tokenLocked = false;
    _keyPair = null;
    _jwt = null;
  }

  Future<JWT> _fetchJWT(String path) async {
    final response = await post(
      Uri.https(serverName, path),
      headers: {
        'Authorization': 'Bearer ${_createAuthRequestToken()}',
      },
    );
    switch (response.statusCode) {
      case 200:
        final body = jsonDecode(response.body) as Map;
        return (
          id: body['subject'] as String,
          accessToken: body['access_token'] as String,
          expiresAt: DateTime.timestamp()
              .add(Duration(seconds: body['expires_in'] as int)),
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
      'pk': base64UrlEncode(_keyPair!.publicKey.bytes).replaceAll('=', ''),
      'iat': now,
      'exp': now + jwtExpiresIn.inSeconds,
      // TBD: uuid for jwt invalidation on logout
      'jti': '',
    }))).replaceAll('=', '');
    final signature = base64UrlEncode(sign(
      _keyPair!.privateKey,
      Uint8List.fromList(utf8.encode(_jwtHeader + body)),
    )).replaceAll('=', '');
    return '$_jwtHeader$body.$signature';
  }
}
