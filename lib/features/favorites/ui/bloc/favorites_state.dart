part of 'favorites_cubit.dart';

final class FavoritesState extends StateBase {
  const FavoritesState({
    this.beacons = const <Beacon>[],
    super.status,
    super.error,
  });

  const FavoritesState.empty({
    super.status,
    super.error,
  }) : beacons = const [];

  final List<Beacon> beacons;

  @override
  List<Object?> get props => [
        error,
        status,
        beacons,
        beacons.length,
      ];

  @override
  FavoritesState copyWith({
    Object? error,
    FetchStatus? status,
    bool? hasReachedMax,
    List<Beacon>? beacons,
  }) =>
      FavoritesState(
        error: error ?? this.error,
        status: status ?? (error == null ? this.status : FetchStatus.isFailure),
        beacons: beacons ?? this.beacons,
      );

  @override
  FavoritesState setError(Object error) => FavoritesState(
        status: FetchStatus.isFailure,
        beacons: beacons,
        error: error,
      );

  @override
  FavoritesState setLoading() => FavoritesState(
        status: FetchStatus.isLoading,
        beacons: beacons,
      );
}
