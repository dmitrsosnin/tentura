import 'package:flutter/foundation.dart';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/domain/entity/lat_long.dart';

import '../../data/geo_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

class GeoCubit extends Cubit<LatLng> with HydratedMixin<LatLng> {
  GeoCubit({
    bool fetchOnCreate = true,
    GeoRepository? geoRepository,
  })  : _geoRepository = geoRepository ?? GeoRepository(),
        super(const LatLng(0, 0)) {
    hydrate();
    if (fetchOnCreate) getMyCoords();
  }

  final Map<LatLng, ({String? country, String? locality})?> cache = {};

  final GeoRepository _geoRepository;

  @override
  LatLng? fromJson(Map<String, dynamic> json) =>
      json.isEmpty ? null : LatLng.fromJson(json);

  @override
  Map<String, dynamic>? toJson(LatLng state) =>
      state == this.state ? null : state.toJson();

  Future<LatLng?> getMyCoords() async {
    try {
      final myCoords = await _geoRepository.getMyCoords();
      if (myCoords != null) emit(myCoords);
      return myCoords;
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  Future<({String? country, String? locality})?> getPlaceNameByCoords({
    required LatLng coords,
    required bool useCache,
  }) async {
    if (useCache && cache.containsKey(coords)) return cache[coords];
    try {
      final place = await _geoRepository.getPlaceNameByCoords(
        coords,
        useCache: useCache,
      );
      return cache[coords] = place == null
          ? null
          : (
              country: place.country,
              locality: place.locality,
            );
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }
}
