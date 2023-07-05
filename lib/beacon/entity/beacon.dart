import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'package:gravity/_shared/types.dart';
import 'package:gravity/user/entity/user.dart';

class Beacon extends Equatable {
  static const fragment = '''
fragment beaconFields on beacon {
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
    ...userFields
  }
}
''';

  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEnabled;
  final bool hasPicture;
  final DateTimeRange? dateRange;
  final LatLng? coordinates;
  final User author;

  const Beacon({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.hasPicture = false,
    this.isEnabled = true,
    this.coordinates,
    this.dateRange,
  });

  factory Beacon.fromJson(Json json) {
    final place = json['place'] as Json?;
    final coordinates = place?['coordinates'] as List?;
    final timerange = jsonDecode(json['timerange'] as String? ?? '[]') as List;
    return Beacon(
      id: json['id'] as String,
      author: User.fromJson(json['author'] as Json),
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isEnabled: json['enabled'] as bool,
      hasPicture: json['has_picture'] as bool,
      dateRange: timerange.isEmpty
          ? null
          : DateTimeRange(
              start: DateTime.parse(timerange.first as String),
              end: DateTime.parse(timerange.last as String),
            ),
      coordinates: coordinates == null
          ? null
          : LatLng(coordinates[0] as double, coordinates[1] as double),
    );
  }

  @override
  List<Object?> get props => [
        id,
        author,
        title,
        description,
        createdAt,
        updatedAt,
        isEnabled,
        dateRange,
        coordinates,
        hasPicture,
      ];

  bool get hasNoPicture => !hasPicture;
}
