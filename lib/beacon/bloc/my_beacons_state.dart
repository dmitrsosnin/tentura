import 'package:equatable/equatable.dart';

import 'package:gravity/beacon/entity/beacon.dart';

class MyBeaconsState extends Equatable {
  final List<Beacon> beacons;

  final bool isLoading;
  final Object? error;

  const MyBeaconsState({
    this.isLoading = false,
    this.error,
    this.beacons = const [],
  });

  @override
  List<Object?> get props => [
        error,
        beacons,
        beacons.length,
      ];

  bool get isEmpty => beacons.isEmpty;

  MyBeaconsState copyWith({
    bool? isLoading,
    Object? error,
    bool clearError = false,
    List<Beacon>? beacons,
  }) =>
      MyBeaconsState(
        isLoading: isLoading ?? this.isLoading,
        error: clearError ? null : error ?? this.error,
        beacons: beacons ?? this.beacons,
      );
}
