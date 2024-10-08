import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';
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
        ..created_at = zeroDateTime
        ..updated_at = zeroDateTime
        ..author = (GBeaconFieldsData_authorBuilder()
          ..id = ''
          ..title = ''
          ..description = ''
          ..has_picture = false))
      .build() as Beacon;

  int get myVote => my_vote ?? 0;

  String get imageId => i.has_picture ? i.id : '';

  bool get hasCoordinates => lat != null && long != null;

  Coordinates get coordinates => (
        lat: double.tryParse(lat?.value ?? '.0') ?? 0,
        long: double.tryParse(long?.value ?? '.0') ?? 0,
      );

  Beacon copyWith({
    String? id,
    String? title,
    String? description,
    String? authorId,
    bool? hasPicture,
    String? context,
    bool? isPinned,
    bool? enabled,
    int? myVote,
    int? commentsCount,
    Coordinates? coordinates,
    DateTimeRange? dateRange,
  }) =>
      (GBeaconFieldsDataBuilder()
            ..id = id ?? this.id
            ..title = title ?? this.title
            ..description = description ?? this.description
            ..context = context ?? this.context
            ..enabled = enabled ?? this.enabled
            ..is_pinned = isPinned ?? is_pinned
            ..has_picture = hasPicture ?? has_picture
            ..comments_count = commentsCount ?? comments_count
            ..timerange = dateRange ?? timerange
            ..my_vote = myVote ?? my_vote
            ..lat = (coordinates == null
                ? lat?.toBuilder()
                : (Gfloat8Builder()..value = coordinates.lat.toString()))
            ..long = (coordinates == null
                ? long?.toBuilder()
                : (Gfloat8Builder()..value = coordinates.long.toString()))
            ..created_at = created_at
            ..updated_at = updated_at
            ..author = (GBeaconFieldsData_authorBuilder()
              ..id = authorId ?? author.id
              ..title = author.title
              ..description = author.description
              ..has_picture = author.has_picture))
          .build() as Beacon;
}
