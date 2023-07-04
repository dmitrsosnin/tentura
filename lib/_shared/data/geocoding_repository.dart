import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:gravity/_shared/types.dart';

class GeocodingRepository {
  GeocodingRepository() {
    getMyCoords(useCached: false).then((value) => _myCoords = value);
  }

  GeoCoords? _myCoords;

  GeoCoords? get myCoords {
    if (_myCoords == null) getMyCoords(useCached: false);
    return _myCoords;
  }

  Future<GeocodingRepository> init() async {
    _myCoords = await getMyCoords(useCached: false);
    return this;
  }

  Future<GeoCoords?> getMyCoords({bool useCached = true}) async {
    if (useCached && _myCoords != null) return _myCoords;
    if (await Geolocator.isLocationServiceEnabled()) {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) return null;
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return null;
        if (permission == LocationPermission.deniedForever) return null;
      }
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
}
