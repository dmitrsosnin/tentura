import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:gravity/_shared/types.dart';
import 'package:gravity/beacon/entity/beacon.dart';
import 'package:gravity/_shared/data/api_service.dart';

class BeaconRepository {
  final _apiService = GetIt.I<ApiService>();

  Future<Beacon> createBeacon({
    required final String title,
    required final String description,
    final DateTimeRange? dateRange,
    final GeoCoords? coordinates,
  }) async {
    final data = await _apiService.mutate(
      query: r'''
mutation CreateBeacon($title: String!, $description: String!, $place: geography, $timerange: tstzrange) {
  insert_beacon_one(object: {title: $title, description: $description, place: $place, timerange: $timerange}) {
    id
    author_id
    title
    description
    created_at
    updated_at
    enabled
    place
    timerange
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
      },
    );
    return Beacon.fromJson(data['insert_beacon_one'] as Json);
  }
}
