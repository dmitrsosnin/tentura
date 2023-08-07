import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

typedef UploadProgress = ({
  bool isFinished,
  int totalBytes,
  int bytesTransferred,
});

class ImageRepository {
  Future<({String path, String name})?> pickImage() async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      // TBD: resize and convert by package:image
      maxWidth: 600,
    );
    return xFile == null ? null : (path: xFile.path, name: xFile.name);
  }

  Stream<UploadProgress> putAvatar({
    required String userId,
    required Uint8List image,
  }) =>
      FirebaseStorage.instance
          .ref('$userId/avatar.jpg')
          .putData(image)
          .snapshotEvents
          .map((event) => (
                totalBytes: event.totalBytes,
                bytesTransferred: event.bytesTransferred,
                isFinished: event.totalBytes == event.bytesTransferred,
              ));

  Stream<UploadProgress> putBeacon({
    required String userId,
    required String beaconId,
    required Uint8List image,
  }) =>
      FirebaseStorage.instance
          .ref('$userId/$beaconId.jpg')
          .putData(image)
          .snapshotEvents
          .map((event) => (
                totalBytes: event.totalBytes,
                bytesTransferred: event.bytesTransferred,
                isFinished: event.totalBytes == event.bytesTransferred,
              ));

  Future<void> deleteBeacon({
    required String userId,
    required String beaconId,
  }) =>
      FirebaseStorage.instance.ref('$userId/$beaconId.jpg').delete();

  Future<void> deleteProfile({required String userId}) =>
      FirebaseStorage.instance.ref(userId).delete();
}
