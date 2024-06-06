import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:ferry/ferry.dart';
import 'package:fresh_graphql/fresh_graphql.dart';

import 'gql_client.dart';
import 'image_service.dart';
import 'token_service.dart';

//TBD: - cache authRequestToken
class TenturaApi {
  TenturaApi({
    required this.serverName,
    Duration jwtExpiresIn = const Duration(minutes: 1),
  })  : _imageService = ImageService(
          serverName: serverName,
        ),
        _tokenService = TokenService(
          serverName: serverName,
          jwtExpiresIn: jwtExpiresIn,
        );

  final String serverName;

  late final Client gqlClient;

  late final _authLink = FreshLink.oAuth2(
    tokenStorage: InMemoryTokenStorage(),
    tokenHeader: (token) => {
      'Authorization': 'Bearer ${token!.accessToken}',
    },
    refreshToken: (token, client) async {
      final jwt = await _tokenService.fetchJWT(
        keyPair: _keyPair,
        path: 'user/login',
      );
      return OAuth2Token(
        accessToken: jwt.accessToken,
        expiresIn: jwt.expiresIn,
      );
    },
    shouldRefresh: (response) => response.errors != null,
  );

  final TokenService _tokenService;
  final ImageService _imageService;

  String _userId = '';

  late KeyPair _keyPair;

  String get userId => _userId;

  Future<String> get token => _authLink.token.then((e) => e?.accessToken ?? '');

  Future<TenturaApi> init({
    Directory? storageDirectory,
  }) async {
    gqlClient = await buildGqlClient(
      authLink: _authLink,
      serverName: serverName,
      storageDirectory: storageDirectory,
    );
    return this;
  }

  Future<void> dispose() async {
    await gqlClient.dispose();
    await _authLink.dispose();
  }

  Future<String> signIn({
    required String seed,
    String? prematureUserId,
  }) async {
    if (prematureUserId != null) _userId = prematureUserId;
    _keyPair = await _tokenService.keyPairFromSeed(seed);
    final jwt = await _tokenService.fetchJWT(
      keyPair: _keyPair,
      path: 'user/login',
    );
    await _authLink.setToken(OAuth2Token(
      accessToken: jwt.accessToken,
      expiresIn: jwt.expiresIn,
    ));
    return _userId = jwt.id;
  }

  Future<({String id, String seed})> signUp() async {
    _keyPair = await _tokenService.generateKeyPair();
    final jwt = await _tokenService.fetchJWT(
      keyPair: _keyPair,
      path: 'user/register',
    );
    await _authLink.setToken(OAuth2Token(
      accessToken: jwt.accessToken,
      expiresIn: jwt.expiresIn,
    ));
    return (
      id: _userId = jwt.id,
      seed: await _tokenService.seedFromKeyPair(_keyPair),
    );
  }

  // TBD: invalidate jwt on remote server also
  Future<void> signOut() async {
    _userId = '';
    await _authLink.clearToken();
  }

  // TBD: remove account on remote server
  Future<void> delete() async {
    _userId = '';
    await _authLink.clearToken();
  }

  Future<void> putAvatarImage(Uint8List image) async => _imageService.putAvatar(
        token: await token,
        userId: userId,
        image: image,
      );

  Future<void> putBeaconImage(
    Uint8List image, {
    required String beaconId,
  }) async =>
      _imageService.putBeacon(
        token: await token,
        beaconId: beaconId,
        userId: userId,
        image: image,
      );
}
