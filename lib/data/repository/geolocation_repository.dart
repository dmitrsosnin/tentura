import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:tentura/domain/entity/lat_long.dart';

class GeolocationRepository {
  GeolocationRepository({bool checkOnStart = true}) {
    if (checkOnStart) {
      getMyCoords(isNeedRequest: false).then((v) => _myCoords = v);
    }
  }
  LatLng? _myCoords;

  LatLng? get myCoords {
    if (_myCoords == null) getMyCoords();
    return _myCoords;
  }

  Future<LatLng?> getMyCoords({
    bool isNeedRequest = true,
    Duration timeLimit = const Duration(seconds: 15),
  }) async {
    if (_myCoords != null) return _myCoords;
    if (await Geolocator.isLocationServiceEnabled() &&
        await _checkLocationPermission(isNeedRequest)) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest,
          timeLimit: timeLimit,
        );
        return _myCoords = LatLng(position.latitude, position.longitude);
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

  Future<Placemark?> getPlaceNameByCoords(LatLng coords) async {
    try {
      return (await placemarkFromCoordinates(coords.latitude, coords.longitude))
          .firstOrNull;
    } catch (_) {
      return null;
    }
  }
}
