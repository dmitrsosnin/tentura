import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:gravity/_shared/types.dart';

class ImageRepository {
  static const _avatar = '/avatar.jpg';

  Stream<UploadProgress> uploadAvatar({
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

  Future<String> getAvatarURL(String userId) async {
    if (userId.isEmpty) return '';
    try {
      return FirebaseStorage.instance.ref(userId + _avatar).getDownloadURL();
    } catch (_) {
      return '';
    }
  }
}
