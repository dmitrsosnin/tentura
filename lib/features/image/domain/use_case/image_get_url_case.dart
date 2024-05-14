import 'package:tentura/consts.dart';

class ImageGetUrlCase {
  const ImageGetUrlCase({
    this.serverName = appLinkBase,
  });

  final String serverName;

  String getAvatarUrl(String userId) =>
      'https://$serverName/images/$userId/avatar.jpg';

  String getBeaconUrl(String userId, String beaconId) =>
      'https://$serverName/images/$userId/$beaconId.jpg';
}
