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
    FetchStatus? status,
    Object? error,
    List<GBeaconFields>? beacons,
    bool? hasReachedMax,
  }) =>
      MyFieldState(
        status: status ?? (error == null ? this.status : FetchStatus.hasError),
        error: error ?? this.error,
        beacons: beacons ?? this.beacons,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object> get props => [
        status,
        beacons,
        beacons.length,
        hasReachedMax,
      ];
}
