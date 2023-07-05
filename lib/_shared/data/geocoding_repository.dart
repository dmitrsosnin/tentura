import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:gravity/_shared/types.dart';

class GeocodingRepository {
  GeoCoords? _myCoords;

  GeoCoords? get myCoords {
    if (_myCoords == null) getMyCoords();
    return _myCoords;
  }

  Future<GeocodingRepository> init() async {
    _myCoords = await getMyCoords(isNeedRequest: false);
    return this;
  }

  Future<({String city, String country})?> getPlaceByCoords(
    GeoCoords? coords,
  ) async {
    if (coords != null) {
      try {
        final place = (await placemarkFromCoordinates(coords.lat, coords.long))
            .firstOrNull;
        return place == null
            ? null
            : (
                city: place.locality ?? 'Unknown',
                country: place.country ?? place.name ?? 'Unknown',
              );
      } catch (e) {
        if (kDebugMode) print(e);
      }
    }
    return null;
  }

  Future<GeoCoords?> getMyCoords({bool isNeedRequest = true}) async {
    if (_myCoords != null) return _myCoords;
    if (await Geolocator.isLocationServiceEnabled() &&
        await _checkLocationPermission(isNeedRequest)) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest,
          timeLimit: const Duration(seconds: 15),
        );
        return _myCoords = (lat: position.latitude, long: position.longitude);
      } catch (e) {
        if (kDebugMode) print(e);
      }
    }
    return null;
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
