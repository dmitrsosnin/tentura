part of 'my_beacons_cubit.dart';

class MyBeaconsState extends StateBase {
  final List<Beacon> beacons;

  const MyBeaconsState({
    super.status,
    super.error,
    this.beacons = const [],
  });

  @override
  List<Object?> get props => [
        error,
        status,
        beacons,
        beacons.length,
      ];

  bool get isEmpty => beacons.isEmpty;

  MyBeaconsState copyWith({
    BlocDataStatus? status,
    Object? error,
    bool clearError = false,
    List<Beacon>? beacons,
  }) =>
      MyBeaconsState(
        status: status ?? this.status,
        error: clearError ? null : error ?? this.error,
        beacons: beacons ?? this.beacons,
      );
}
