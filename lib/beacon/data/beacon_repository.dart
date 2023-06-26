import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:gravity/_shared/types.dart';
import 'package:gravity/_shared/data/api_service.dart';

import 'package:gravity/beacon/entity/beacon.dart';

part 'beacon_queries.dart';

class BeaconRepository {
  final _apiService = GetIt.I<ApiService>();
  final _updatesController = StreamController<Beacon>.broadcast();

  Stream<Beacon> get updates => _updatesController.stream;

  Future<Beacon> createBeacon({
    required String title,
    required String description,
    required bool hasPicture,
    DateTimeRange? dateRange,
    GeoCoords? coordinates,
  }) async {
    final data = await _apiService.mutate(
      query: _createBeacon,
      vars: {
        'title': title,
        'description': description,
        'place': coordinates == null
            ? null
            : {
                'type': 'Point',
                'coordinates': [coordinates.lat, coordinates.long],
              },
        'timerange': dateRange == null
            ? null
            : '["${dateRange.start}","${dateRange.end}"]',
        'has_picture': hasPicture,
      },
    );
    final beacon = Beacon.fromJson(data['insert_beacon_one'] as Json);
    _updatesController.add(beacon);
    return beacon;
  }

  Future<List<Beacon>> getBeaconsOf(
    String userId, {
    bool useCache = true,
  }) async {
    if (userId.isEmpty) return [];
    final data = await _apiService.query(
      useCache: useCache,
      query: _getBeaconsOf,
      vars: {'author_id': userId},
    );
    return (data['beacon'] as List)
        .map<Beacon>(
          (e) => Beacon.fromJson(e as Json),
        )
        .toList();
  }
}
