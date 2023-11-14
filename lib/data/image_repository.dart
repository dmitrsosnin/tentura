import 'package:http/http.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepository {
  static String appLinkBase = '';

  static String getAvatarUrl(String userId) =>
      'https://$appLinkBase/$userId/avatar.jpg';

  static String getBeaconUrl(String userId, String beaconId) =>
      'https://$appLinkBase/$userId/$beaconId.jpg';

  ImageRepository({required String appLinkBase}) {
    appLinkBase = appLinkBase;
  }

  Future<({String path, String name})?> pickImage() async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      // TBD: resize and convert by package:image
      maxWidth: 600,
    );
    return xFile == null ? null : (path: xFile.path, name: xFile.name);
  }

  Future<void> putAvatar({
    required String userId,
    required Uint8List image,
    required String authToken,
  }) =>
      put(
        Uri.https(appLinkBase, '/images/$userId/avatar.jpg'),
        headers: {
          'Content-Type': 'image/jpeg',
          'Authorization': 'Bearer $authToken',
        },
        body: image,
      );

  Future<void> putBeacon({
    required String userId,
    required String beaconId,
    required Uint8List image,
    required String authToken,
  }) =>
      put(
        Uri.https(appLinkBase, '/images/$userId/$beaconId.jpg'),
        headers: {
          'Content-Type': 'image/jpeg',
          'Authorization': 'Bearer $authToken',
        },
        body: image,
      );
}
