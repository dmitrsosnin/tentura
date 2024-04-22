import 'package:http/http.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tentura/consts.dart';

class ImageRepository {
  static String _appLinkBase = appLinkBase;

  static String getAvatarUrl(String userId) =>
      'https://$_appLinkBase/images/$userId/avatar.jpg';

  static String getBeaconUrl(String userId, String beaconId) =>
      'https://$_appLinkBase/images/$userId/$beaconId.jpg';

  ImageRepository({String? appLinkBase}) {
    if (appLinkBase != null) _appLinkBase = appLinkBase;
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
        Uri.https(_appLinkBase, '/images/$userId/avatar.jpg'),
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
        Uri.https(_appLinkBase, '/images/$userId/$beaconId.jpg'),
        headers: {
          'Content-Type': 'image/jpeg',
          'Authorization': 'Bearer $authToken',
        },
        body: image,
      );
}
