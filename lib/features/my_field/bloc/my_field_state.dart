part of 'my_field_cubit.dart';

final class MyFieldState extends StateBase {
  const MyFieldState({
    this.beacons = const <GBeaconFields>[],
    this.hasReachedMax = false,
    super.status = FetchStatus.isEmpty,
    super.error,
  });

  final List<GBeaconFields> beacons;
  final bool hasReachedMax;

  @override
  MyFieldState copyWith({
    Object? error,
    FetchStatus? status,
    bool? hasReachedMax,
    List<GBeaconFields>? beacons,
  }) =>
      MyFieldState(
        error: error ?? this.error,
        status: status ?? (error == null ? this.status : FetchStatus.hasError),
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        beacons: beacons ?? this.beacons,
      );

  @override
  List<Object?> get props => [
        error,
        status,
        beacons,
        beacons.length,
        hasReachedMax,
      ];
}
