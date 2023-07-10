import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:gravity/types.dart';
import 'package:gravity/entity/beacon.dart';
import 'package:gravity/data/api_service.dart';

import 'gql_queries.dart';

class BeaconRepository {
  final _apiService = GetIt.I<ApiService>();
  final _updatesController = StreamController<Beacon>.broadcast();

  Stream<Beacon> get updates => _updatesController.stream;

  Future<Beacon> createBeacon({
    required String title,
    required String description,
    required bool hasPicture,
    DateTimeRange? dateRange,
    LatLng? coordinates,
  }) async {
    final data = await _apiService.mutate(
      query: mCreateBeacon,
      vars: {
        'title': title,
        'description': description,
        'place': coordinates == null
            ? null
            : {
                'type': 'Point',
                'coordinates': [coordinates.latitude, coordinates.longitude],
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

  Future<List<Beacon>> getBeaconsByUserId(
    String userId, {
    bool useCache = true,
  }) async {
    if (userId.isEmpty) return [];
    final data = await _apiService.query(
      fetchPolicy: useCache ? FetchPolicy.cacheFirst : FetchPolicy.networkOnly,
      query: qFetchBeaconsOf,
      vars: {'user_id': userId},
    );
    return (data['beacon'] as List)
        .map<Beacon>((e) => Beacon.fromJson(e as Json))
        .toList();
  }

  Future<List<Beacon>> getBeaconsByIdPrefix(
    String searchPrefix, {
    int limit = 10,
  }) async {
    final data = await _apiService.query(
      fetchPolicy: FetchPolicy.noCache,
      query: qSearchBeconById,
      vars: {
        'startsWith': '$searchPrefix%',
        'limit': limit,
      },
    );
    return (data['beacon'] as List)
        .map<Beacon>((e) => Beacon.fromJson(e as Json))
        .toList();
  }
}
