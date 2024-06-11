import 'dart:async';
import 'dart:typed_data';
import 'package:ferry/ferry.dart';
import 'package:ferry/ferry_isolate.dart';
import 'package:fresh_graphql/fresh_graphql.dart';

import 'client/gql_client.dart';
import 'service/image_service.dart';
import 'service/token_service.dart';

class TenturaApi {
  TenturaApi({
    required this.serverName,
    this.jwtExpiresIn = const Duration(minutes: 1),
    this.storagePath = '',
  })  : _imageService = ImageService(
          serverName: serverName,
        ),
        _tokenService = TokenService(
          serverName: serverName,
          jwtExpiresIn: jwtExpiresIn,
        );

  final String serverName;
  final String storagePath;
  final Duration jwtExpiresIn;

  late final IsolateClient _gqlClient;

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
    shouldRefresh: (response) => true,
  );

  final TokenService _tokenService;
  final ImageService _imageService;

  String _userId = '';

  late KeyPair _keyPair;

  String get userId => _userId;

  Stream<AuthenticationStatus> get authenticationStatus =>
      _authLink.authenticationStatus;

  Future<void> init() async {
    _gqlClient = await IsolateClient.create(
      buildClient,
      params: (
        serverName: serverName,
        storagePath: storagePath,
      ),
      messageHandler: (message) async {
        if (message is GetTokenMessage) {
          message.replyPort.send(await _getToken());
        }
      },
    );
  }

  Future<void> dispose() async {
    await _gqlClient.dispose();
    await _authLink.dispose();
  }

  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    Stream<OperationResponse<TData, TVars>> Function(
            OperationRequest<TData, TVars>)?
        forward,
  ]) =>
      _gqlClient.request(request, forward);

  Future<void> addRequest(OperationRequest<dynamic, dynamic> request) =>
      _gqlClient.addRequestToRequestController(request);

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
    await _gqlClient.clearCache();
  }

  // TBD: remove account on remote server
  Future<void> delete() async {
    _userId = '';
    await _authLink.clearToken();
    await _gqlClient.clearCache();
  }

  Future<void> putAvatarImage(Uint8List image) async => _imageService.putAvatar(
        token: await _getToken() ?? '',
        userId: userId,
        image: image,
      );

  Future<void> putBeaconImage(
    Uint8List image, {
    required String beaconId,
  }) async =>
      _imageService.putBeacon(
        token: await _getToken() ?? '',
        beaconId: beaconId,
        userId: userId,
        image: image,
      );

  Future<String?> _getToken() => _authLink.token.then((e) => e?.accessToken);
}
