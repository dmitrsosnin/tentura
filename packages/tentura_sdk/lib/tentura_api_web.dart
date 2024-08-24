import 'dart:async';
import 'dart:typed_data';
import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

import 'consts.dart';
import 'client/auth_link.dart';
import '../service/image_service.dart';
import '../service/token_service_web.dart';

class TenturaApi {
  TenturaApi({
    required this.serverName,
    this.jwtExpiresIn = const Duration(minutes: 1),
    this.userAgent = 'Tentura client',
    this.storagePath = '',
  })  : _imageService = ImageService(
          serverName: serverName,
        ),
        _tokenService = TokenService(
          serverName: serverName,
          jwtExpiresIn: jwtExpiresIn,
        );

  final String userAgent;
  final String serverName;
  final String storagePath;
  final Duration jwtExpiresIn;

  late final Client _gqlClient;

  final TokenService _tokenService;
  final ImageService _imageService;

  String _userId = '';

  String get userId => _userId;

  Future<void> init() async {
    _gqlClient = Client(
      link: Link.concat(
        AuthLink(() => _tokenService.getToken().then((v) => v.value)),
        HttpLink(
          Uri.https(
            serverName,
            pathGraphQLEndpoint,
          ).toString(),
          defaultHeaders: {
            'accept': 'application/json',
          },
        ),
      ),
    );
  }

  Future<void> dispose() async {
    await _gqlClient.dispose();
  }

  Future<String> signIn({
    required String seed,
    String? prematureUserId,
  }) async {
    if (prematureUserId != null) _userId = prematureUserId;
    await _tokenService.setKeyPairFromSeed(seed);
    return _userId = await _tokenService.signIn();
  }

  Future<({String id, String seed})> signUp() async {
    final seed = await _tokenService.setNewKeyPair();
    _userId = await _tokenService.signUp();
    return (id: _userId, seed: seed);
  }

  Future<void> signOut() async {
    _userId = '';
    await _tokenService.signOut();
    _gqlClient.cache.clear();
  }

  Future<void> putAvatarImage(Uint8List image) async => _imageService.putAvatar(
        token: (await _tokenService.getToken()).valueOrException,
        userId: userId,
        image: image,
      );

  Future<void> putBeaconImage(
    Uint8List image, {
    required String beaconId,
  }) async =>
      _imageService.putBeacon(
        token: (await _tokenService.getToken()).valueOrException,
        beaconId: beaconId,
        userId: userId,
        image: image,
      );

  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    Stream<OperationResponse<TData, TVars>> Function(
            OperationRequest<TData, TVars>)?
        forward,
  ]) =>
      _gqlClient.request(request);

  Future<void> addRequestToRequestController<TData, TVars>(
    OperationRequest<TData, TVars> request,
  ) async =>
      _gqlClient.requestController.add(request);
}
