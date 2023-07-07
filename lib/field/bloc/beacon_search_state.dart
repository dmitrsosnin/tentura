part of 'beacon_search_cubit.dart';

class BeaconSearchState extends StateBase {
  final String searchQuery;
  final List<Beacon> beacons;

  const BeaconSearchState({
    this.searchQuery = '',
    this.beacons = const [],
    super.status,
    super.error,
  });

  @override
  List<Object?> get props => [
        error,
        status,
        searchQuery,
        beacons,
      ];

  BeaconSearchState copyWith({
    BlocDataStatus? status,
    Object? error,
    bool clearError = false,
    String? searchQuery,
    List<Beacon>? beacons,
  }) =>
      BeaconSearchState(
        status: error != null ? BlocDataStatus.hasError : status ?? this.status,
        error: clearError ? null : error ?? this.error,
        searchQuery: searchQuery ?? this.searchQuery,
        beacons: beacons ?? this.beacons,
      );
}
