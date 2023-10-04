import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:gravity/consts.dart';

class ImageRepository {
  static const baseUrl = 'https://$appLinkBase/images/';
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
    String? authToken,
  }) =>
      http.put(
        Uri.https(
          appLinkBase,
          '/images/$userId/avatar.jpg',
        ),
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
    String? authToken,
  }) =>
      http.put(
        Uri.https(
          appLinkBase,
          '/images/$userId/$beaconId.jpg',
        ),
        headers: {
          'Content-Type': 'image/jpeg',
          'Authorization': 'Bearer $authToken',
        },
        body: image,
      );

  Future<void> deleteBeacon({
    required String userId,
    required String beaconId,
    String? authToken,
  }) =>
      http.delete(
        Uri.https(
          appLinkBase,
          '/images/$userId/$beaconId.jpg',
        ),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );
}
