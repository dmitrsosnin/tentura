import 'package:flutter/material.dart' show DateTimeRange;

import 'package:tentura/domain/entity/geo.dart';
import 'package:tentura/data/gql/_g/schema.schema.gql.dart';

import '_g/beacon.data.gql.dart';

extension type const Beacon(GBeaconFields i) implements GBeaconFields {
  static final empty = (GBeaconFieldsDataBuilder()
        ..id = ''
        ..title = ''
        ..description = ''
        ..enabled = false
        ..has_picture = false
        ..comments_count = 0
        ..my_vote = 0
        ..created_at = DateTime.fromMillisecondsSinceEpoch(0)
        ..updated_at = DateTime.fromMillisecondsSinceEpoch(0)
        ..author = (GBeaconFieldsData_authorBuilder()
          ..id = ''
          ..title = ''
          ..has_picture = false))
      .build() as Beacon;

  Beacon copyWith({
    String? id,
    String? title,
    String? description,
    bool? hasPicture,
    String? context,
    Coordinates? coordinates,
    DateTimeRange? dateRange,
  }) =>
      (GBeaconFieldsDataBuilder()
            ..id = id ?? this.id
            ..title = title ?? this.title
            ..description = description ?? this.description
            ..context = context ?? this.context
            ..has_picture = hasPicture ?? has_picture
            ..timerange = dateRange ?? timerange
            ..lat = (coordinates == null
                ? lat?.toBuilder()
                : (Gfloat8Builder()..value = coordinates.lat.toString()))
            ..long = (coordinates == null
                ? long?.toBuilder()
                : (Gfloat8Builder()..value = coordinates.long.toString()))
            ..created_at = created_at
            ..updated_at = updated_at)
          .build() as Beacon;
}
