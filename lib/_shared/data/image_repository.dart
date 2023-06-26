import 'package:flutter/services.dart';

import 'image_service.dart';

typedef UploadProgress = ({
  bool isFinished,
  int totalBytes,
  int bytesTransferred,
});

class ImageRepository {
  static const _avatar = '/avatar.jpg';

  ImageRepository({
    ImageService imageService = const ImageService(),
  }) : _imageService = imageService;

  final ImageService _imageService;

  // TBD: persistance cache, limit cached items count
  final Map<String, Uint8List> _cacheAvatar = {};
  final Map<String, Uint8List> _cacheBeacon = {};

  Future<({String path, String name})?> pickImage() async {
    final xFile = await _imageService.pickImage();
    return xFile == null ? null : (path: xFile.path, name: xFile.name);
  }

  void evictAvatarOf(String userId) => _cacheAvatar.remove(userId);

  Future<Uint8List?> getAvatarOf(String userId) async {
    if (_cacheAvatar.containsKey(userId)) return _cacheAvatar[userId];
    final image = await _imageService.getRef(userId + _avatar).getData();
    if (image != null) _cacheAvatar[userId] = image;
    return image;
  }

  Stream<UploadProgress> putAvatar({
    required String userId,
    required Uint8List image,
  }) {
    _cacheAvatar[userId] = image;
    return _imageService
        .getRef(userId + _avatar)
        .putData(image)
        .snapshotEvents
        .map((event) => (
              totalBytes: event.totalBytes,
              bytesTransferred: event.bytesTransferred,
              isFinished: event.totalBytes == event.bytesTransferred,
            ));
  }

  Future<Uint8List?> getBeaconOf(String userId, String beaconId) async {
    if (_cacheBeacon.containsKey(beaconId)) return _cacheBeacon[beaconId];
    final image = await _imageService.getRef('$userId/$beaconId.jpg').getData();
    if (image != null) _cacheBeacon[beaconId] = image;
    return image;
  }

  Stream<UploadProgress> putBeacon({
    required String userId,
    required String beaconId,
    required Uint8List image,
  }) {
    _cacheBeacon[beaconId] = image;
    return _imageService
        .getRef('$userId/$beaconId.jpg')
        .putData(image)
        .snapshotEvents
        .map((event) => (
              totalBytes: event.totalBytes,
              bytesTransferred: event.bytesTransferred,
              isFinished: event.totalBytes == event.bytesTransferred,
            ));
  }
}
