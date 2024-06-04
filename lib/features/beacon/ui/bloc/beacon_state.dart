part of 'beacon_cubit.dart';

final class BeaconState extends StateBase {
  const BeaconState({
    this.beacons = const [],
    super.status,
    super.error,
  });

  final List<Beacon> beacons;

  @override
  List<Object?> get props => [
        status,
        error,
        beacons,
      ];

  @override
  BeaconState copyWith({
    List<Beacon>? beacons,
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
}
