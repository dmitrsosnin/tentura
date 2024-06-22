part of 'my_field_cubit.dart';

final class MyFieldState extends StateBase {
  const MyFieldState({
    this.beacons = const <Beacon>[],
    super.status,
    super.error,
  });

  final List<Beacon> beacons;

  @override
  List<Object?> get props => [
        error,
        status,
        beacons,
        beacons.length,
      ];

  @override
  MyFieldState copyWith({
    Object? error,
    FetchStatus? status,
    bool? hasReachedMax,
    List<Beacon>? beacons,
  }) =>
      MyFieldState(
        error: error ?? this.error,
        status: status ?? (error == null ? this.status : FetchStatus.isFailure),
        beacons: beacons ?? this.beacons,
      );

  @override
  MyFieldState setError(Object error) => MyFieldState(
        status: FetchStatus.isFailure,
        beacons: beacons,
        error: error,
      );

  @override
  MyFieldState setLoading() => MyFieldState(
        status: FetchStatus.isLoading,
        beacons: beacons,
      );
}
