import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';

import 'package:gravity/_shared/types.dart';

class PlatformService {
  const PlatformService();

  Future<PlatformService> init() async {
    return this;
  }

  Future<({String path, String name})?> pickImage() async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      // TBD: resize and convert by packagr:image
      maxWidth: 600,
    );
    return xFile == null ? null : (path: xFile.path, name: xFile.name);
  }

  Future<Placemark?> getPlaceNameByCoords(LatLng coords) async {
    try {
      return (await placemarkFromCoordinates(coords.latitude, coords.longitude))
          .firstOrNull;
    } catch (_) {
      return null;
    }
  }
}
