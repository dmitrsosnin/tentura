import 'package:http/http.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fresh_graphql/fresh_graphql.dart';

import 'package:tentura/consts.dart';

class ImageRepository {
  static String _serverName = appLinkBase;

  static String getAvatarUrl(String userId) =>
      'https://$_serverName/images/$userId/avatar.jpg';

  static String getBeaconUrl(String userId, String beaconId) =>
      'https://$_serverName/images/$userId/$beaconId.jpg';

  ImageRepository({
    required this.link,
    String serverName = appLinkBase,
  }) {
    _serverName = serverName;
  }

  final FreshLink<OAuth2Token> link;

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
  }) async =>
      put(
        Uri.https(_serverName, '/images/$userId/avatar.jpg'),
        headers: {
          'Content-Type': 'image/jpeg',
          'Authorization': 'Bearer ${(await link.token)!.accessToken}',
        },
        body: image,
      );

  Future<void> putBeacon({
    required String userId,
    required String beaconId,
    required Uint8List image,
  }) async =>
      put(
        Uri.https(_serverName, '/images/$userId/$beaconId.jpg'),
        headers: {
          'Content-Type': 'image/jpeg',
          'Authorization': 'Bearer ${(await link.token)!.accessToken}',
        },
        body: image,
      );
}
