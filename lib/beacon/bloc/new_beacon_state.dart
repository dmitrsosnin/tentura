import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'package:gravity/_shared/types.dart';
import 'package:gravity/_shared/consts.dart';

enum NewBeaconStatus { initial, done, error }

class NewBeaconState extends Equatable {
  final NewBeaconStatus status;
  final Object? error;
  final String title, description, imagePath;
  final DateTimeRange? dateRange;
  final GeoCoords? coordinates;

  const NewBeaconState({
    this.status = NewBeaconStatus.initial,
    this.title = '',
    this.imagePath = '',
    this.description = '',
    this.error,
    this.dateRange,
    this.coordinates,
  });

  @override
  List<Object?> get props => [
        status,
        error,
        title,
        description,
        imagePath,
        dateRange,
        coordinates,
      ];

  bool get isValid => title.length >= titleMinLength;

  NewBeaconState copyWith({
    String? title,
    String? description,
    String? imagePath,
    DateTimeRange? dateRange,
    bool clearDateRange = false,
    GeoCoords? coordinates,
    bool clearCoordinates = false,
    Object? error,
    bool clearError = false,
    NewBeaconStatus? status,
  }) =>
      NewBeaconState(
        title: title ?? this.title,
        description: description ?? this.description,
        imagePath: imagePath ?? this.imagePath,
        dateRange: clearDateRange ? null : dateRange ?? this.dateRange,
        coordinates: clearCoordinates ? null : coordinates ?? this.coordinates,
        error: clearError ? null : error ?? this.error,
        status: status ?? this.status,
      );
}
