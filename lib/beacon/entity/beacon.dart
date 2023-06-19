import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'package:gravity/_shared/types.dart';

class Beacon extends Equatable {
  final String id, authorId, title, description;
  final DateTime createdAt, updatedAt;
  final DateTimeRange? dateRange;
  final GeoCoords? coordinates;
  final bool isEnabled;

  const Beacon({
    required this.id,
    required this.authorId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.dateRange,
    this.coordinates,
    this.isEnabled = true,
  });

  factory Beacon.fromJson(Json json) {
    final place = json['place'] as Json?;
    final coordinates = place?['coordinates'] as List<double>?;
    final timerange = json['timerange'] as String?;
    return Beacon(
      id: json['id'] as String,
      authorId: json['author_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isEnabled: json['enabled'] as bool,
      dateRange: timerange == null
          ? null
          : DateTimeRange(
              start: DateTime.parse(timerange.substring(2, 24)),
              end: DateTime.parse(timerange.substring(27, 49)),
            ),
      coordinates: coordinates == null
          ? null
          : (lat: coordinates[0], long: coordinates[1]),
    );
  }

  @override
  List<Object?> get props => [
        id,
        authorId,
        title,
        description,
        createdAt,
        updatedAt,
        isEnabled,
        dateRange,
        coordinates,
      ];

  Beacon copyWith({
    String? title,
    String? description,
    bool? isEnabled,
    DateTimeRange? dateRange,
    bool clearDateRange = false,
    GeoCoords? coordinates,
    bool clearCoordinates = false,
  }) =>
      Beacon(
        id: id,
        authorId: authorId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        title: title ?? this.title,
        description: description ?? this.description,
        isEnabled: isEnabled ?? this.isEnabled,
        dateRange: clearDateRange ? null : dateRange ?? this.dateRange,
        coordinates: clearCoordinates ? null : coordinates ?? this.coordinates,
      );
}
