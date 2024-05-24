import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:tentura/domain/entity/lat_long.dart';
import 'package:tentura/domain/entity/place_name.dart';

class GeoRepository {
  GeoRepository({bool checkOnStart = true}) {
    if (checkOnStart) {
      getMyCoords(isNeedRequest: false).then((v) => _myCoords = v);
    }
  }
  final Map<LatLng, PlaceName?> cache = {};

  LatLng? _myCoords;

  LatLng? get myCoords {
    if (_myCoords == null) getMyCoords();
    return _myCoords;
  }

  Future<PlaceName?> getPlaceByCoords(
    LatLng coords, {
    bool useCache = false,
  }) async {
    if (useCache && cache.containsKey(coords)) return cache[coords];
    try {
      final places = await placemarkFromCoordinates(
        coords.latitude,
        coords.longitude,
      );
      return places.isEmpty
          ? cache[coords] = null
          : cache[coords] = (
              country: places.first.country,
              locality: places.first.locality,
            );
    } catch (_) {
      return null;
    }
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
}
