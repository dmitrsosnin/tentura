part of 'my_beacons_page_cubit.dart';

class MyBeaconsPageState extends StateBase {
  final List<Beacon> beacons;

  const MyBeaconsPageState({
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

  MyBeaconsPageState copyWith({
    BlocDataStatus? status,
    Object? error,
    bool clearError = false,
    List<Beacon>? beacons,
  }) =>
      MyBeaconsPageState(
        status: status ?? this.status,
        error: clearError ? null : error ?? this.error,
        beacons: beacons ?? this.beacons,
      );
}
