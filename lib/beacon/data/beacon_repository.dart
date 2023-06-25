import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:gravity/_shared/types.dart';
import 'package:gravity/beacon/entity/beacon.dart';
import 'package:gravity/_shared/data/api_service.dart';

class BeaconRepository {
  final _apiService = GetIt.I<ApiService>();
  final _updatesController = StreamController<Beacon>.broadcast();

  Stream<Beacon> get updates => _updatesController.stream;

  Future<Beacon> createBeacon({
    required final String title,
    required final String description,
    final DateTimeRange? dateRange,
    final GeoCoords? coordinates,
    final bool hasPicture = false,
  }) async {
    final data = await _apiService.mutate(
      query: r'''
mutation CreateBeacon($title: String!, $description: String!, $place: geography, $timerange: tstzrange, $has_picture: Boolean!) {
  insert_beacon_one(object: {title: $title, description: $description, place: $place, timerange: $timerange, has_picture: $has_picture}) {
    id
    title
    description
    created_at
    updated_at
    place
    timerange
    has_picture
    enabled
    author {
      id
      uid
      display_name
      description
      has_picture
    }
  }
}
''',
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

  Future<List<Beacon>> getBeaconsOf(String userId, [useCache = true]) async {
    if (userId.isEmpty) return [];
    final data = await _apiService.query(
      useCache: useCache,
      query: r'''
query GetBeaconsOf($author_id: String!) {
  beacon(where: {author_id: {_eq: $author_id}}, order_by: {created_at: desc}) {
    id
    title
    description
    created_at
    updated_at
    place
    timerange
    has_picture
    enabled
    author {
      id
      uid
      display_name
      description
      has_picture
    }
  }
}
''',
      vars: {'author_id': userId},
    );
    return (data['beacon'] as List)
        .map<Beacon>(
          (e) => Beacon.fromJson(e as Json),
        )
        .toList();
  }
}
