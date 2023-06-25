import 'dart:io';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:gravity/_shared/types.dart';

class ImageRepository {
  static const _avatar = '/avatar.jpg';

  // TBD: persistance cache, limit cached items count
  final Map<String, Uint8List> _cacheAvatar = {};
  final Map<String, Uint8List> _cacheBeacon = {};

  void evictAvatarOf(String userId) => _cacheAvatar.remove(userId);

  Future<Uint8List?> getAvatarOf(String userId) async {
    if (_cacheAvatar.containsKey(userId)) return _cacheAvatar[userId];
    final image =
        await FirebaseStorage.instance.ref(userId + _avatar).getData();
    if (image != null) _cacheAvatar[userId] = image;
    return image;
  }

  Stream<UploadProgress> putAvatar({
    required String userId,
    required String picturePath,
  }) {
    final avatarRef = FirebaseStorage.instance.ref(userId + _avatar);
    return avatarRef.putFile(File(picturePath)).snapshotEvents.map(
          (event) => (
            isFinished: event.state == TaskState.success,
            totalBytes: event.totalBytes,
            bytesTransferred: event.bytesTransferred,
          ),
        );
  }

  Future<Uint8List?> getBeaconOf(String userId, String beaconId) async {
    if (_cacheBeacon.containsKey(beaconId)) return _cacheBeacon[beaconId];
    final image =
        await FirebaseStorage.instance.ref('$userId/$beaconId.jpg').getData();
    if (image != null) _cacheBeacon[beaconId] = image;
    return image;
  }

  Stream<UploadProgress> putBeacon({
    required String userId,
    required String beaconId,
    required String imagePath,
  }) {
    final beaconRef = FirebaseStorage.instance.ref('$userId/$beaconId.jpg');
    return beaconRef.putFile(File(imagePath)).snapshotEvents.map(
          (event) => (
            isFinished: event.state == TaskState.success,
            totalBytes: event.totalBytes,
            bytesTransferred: event.bytesTransferred,
          ),
        );
  }
}
