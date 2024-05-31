import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:tentura/domain/entity/geo.dart';

export 'package:tentura/domain/entity/geo.dart';

class GeoRepository {
  GeoRepository({
    bool fetchOnCreate = true,
  }) {
    if (fetchOnCreate) getMyCoords();
  }

  final Map<Coordinates, Place?> cache = {};

  Coordinates? _myCoords;

  Coordinates? get myCoordinates => _myCoords;

  Future<Place?> getPlaceNameByCoords(
    Coordinates coords, {
    bool useCache = true,
  }) async {
    if (useCache && cache.containsKey(coords)) return cache[coords];

    final places = await placemarkFromCoordinates(coords.lat, coords.long);
    return cache[coords] = places.isEmpty
        ? null
        : (
            country: places.first.country,
            locality: places.first.locality,
          );
  }

  Future<Coordinates?> getMyCoords({
    Duration timeLimit = const Duration(seconds: 10),
  }) async {
    if (_myCoords != null) return _myCoords;

    if (await _checkLocationPermission()) {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest,
        timeLimit: timeLimit,
      );
      return (lat: position.latitude, long: position.longitude);
    }

    return null;
  }

  Future<bool> _checkLocationPermission() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) return true;

      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) return true;
    }
    return false;
  }
}
