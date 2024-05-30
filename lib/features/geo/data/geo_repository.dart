import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:tentura/domain/entity/lat_long.dart';

class GeoRepository {
  Future<({String? country, String? locality})?> getPlaceNameByCoords(
    LatLng coords, {
    bool useCache = false,
  }) async {
    final places = await placemarkFromCoordinates(
      coords.latitude,
      coords.longitude,
    );
    return places.isEmpty
        ? null
        : (
            country: places.first.country,
            locality: places.first.locality,
          );
  }

  Future<LatLng?> getMyCoords({
    bool isNeedRequest = true,
    Duration timeLimit = const Duration(seconds: 10),
  }) async {
    if (await Geolocator.isLocationServiceEnabled() &&
        await _checkLocationPermission(isNeedRequest)) {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest,
        timeLimit: timeLimit,
      );
      return LatLng(position.latitude, position.longitude);
    } else {
      return null;
    }
  }

  Future<bool> _checkLocationPermission([bool isNeedRequest = false]) async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) return true;
    if (isNeedRequest) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) return true;
    }
    return false;
  }
}
