import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:gravity/_shared/types.dart';

class ImageRepository {
  static const _avatar = '/avatar.jpg';

  Stream<UploadProgress> putAvatar({
    required String userId,
    required String imagePath,
  }) {
    final avatarRef = FirebaseStorage.instance.ref(userId + _avatar);
    return avatarRef.putFile(File(imagePath)).snapshotEvents.map(
          (event) => (
            isFinished: event.state == TaskState.success,
            totalBytes: event.totalBytes,
            bytesTransferred: event.bytesTransferred,
          ),
        );
  }

  Future<String> getAvatarURL(String userId) =>
      FirebaseStorage.instance.ref(userId + _avatar).getDownloadURL();

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

  Future<String> getBeaconURL({
    required String userId,
    required String beaconId,
  }) =>
      FirebaseStorage.instance.ref('$userId/$beaconId.jpg').getDownloadURL();
}
