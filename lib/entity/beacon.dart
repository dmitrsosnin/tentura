import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:equatable/equatable.dart';

import 'user.dart';

class Beacon extends Equatable {
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
  final int commentsCount;

  const Beacon({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.commentsCount = 0,
    this.hasPicture = false,
    this.isEnabled = true,
    this.coordinates,
    this.dateRange,
  });

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
        commentsCount,
      ];
}
