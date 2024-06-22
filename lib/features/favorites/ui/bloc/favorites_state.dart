part of 'favorites_cubit.dart';

final class FavoritesState extends StateBase {
  static const _listEquality = ListEquality<Beacon>();

  const FavoritesState({
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

  bool isSameAs(FavoritesState state) =>
      _listEquality.equals(state.beacons, beacons);

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
