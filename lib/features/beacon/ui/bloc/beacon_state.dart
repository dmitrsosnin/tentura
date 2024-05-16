part of 'beacon_cubit.dart';

final class BeaconState extends StateBase {
  const BeaconState({
    required this.beacons,
    super.status,
    super.error,
  });

  const BeaconState.empty({
    super.status,
    super.error,
  }) : beacons = const {};

  // TBD
  // ignore: avoid_unused_constructor_parameters
  factory BeaconState.fromJson(Map<String, dynamic> json) =>
      const BeaconState.empty();
  // BeaconState(beacons: GBeaconFieldsData.fromJson(json)!);

  final Map<String, GBeaconFields> beacons;

  @override
  List<Object?> get props => [
        status,
        error,
        beacons,
      ];

  bool get hasError => error != null;

  @override
  BeaconState copyWith({
    Map<String, GBeaconFields>? beacons,
    FetchStatus? status,
    Object? error,
  }) =>
      BeaconState(
        beacons: beacons ?? this.beacons,
        status: status ?? this.status,
        error: error ?? this.error,
      );

  @override
  BeaconState setError(Object error) => BeaconState(
        status: FetchStatus.isFailure,
        beacons: beacons,
        error: error,
      );

  @override
  BeaconState setLoading() => BeaconState(
        status: FetchStatus.isLoading,
        beacons: beacons,
      );

  // TBD
  Map<String, dynamic>? toJson(BeaconState state) => null;
  // state.beacons == beacons ? null : state.beacons.toJson();
}
