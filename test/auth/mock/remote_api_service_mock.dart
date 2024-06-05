import 'dart:io';
import 'dart:typed_data';

import 'package:tentura/data/service/remote_api_service.dart';

class RemoteApiServiceMock implements RemoteApiService {
  static const mockSeed = '4vegTLcjwnxNrMLS3BRFfe1p0lO6VgY5EPNuAcq5ssI=';
  static const mockId = 'Ua42859384644';

  static const _serverName = 'Mock';

  @override
  late final Client gqlClient;

  @override
  String get serverName => _serverName;

  @override
  Future<String?> get token => throw UnimplementedError();

  @override
  Future<RemoteApiService> init({Directory? storageDirectory}) {
    throw UnimplementedError();
  }

  @override
  Future<({String id, String seed})> signUp() async =>
      (id: mockId, seed: mockSeed);

  @override
  Future<String> signIn(String seed) async => mockId;

  @override
  Future<void> dispose() async {}

  @override
  Future<void> delete() async {}

  @override
  Future<void> signOut() async {}

  @override
  Future<void> putAvatar({required String userId, required Uint8List image}) {
    throw UnimplementedError();
  }

  @override
  Future<void> putBeacon(
      {required String userId,
      required String beaconId,
      required Uint8List image}) {
    throw UnimplementedError();
  }
}
