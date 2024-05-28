part of 'beacon_view_cubit.dart';

final class BeaconViewState extends StateBase {
  static final empty = BeaconViewState(
    beacon: Beacon.empty,
  );

  const BeaconViewState({
    required this.beacon,
    this.comments = const [],
    super.status,
    super.error,
  });

  final Beacon beacon;
  final List<Comment> comments;

  @override
  List<Object?> get props => [
        status,
        error,
        beacon,
        comments,
      ];

  @override
  BeaconViewState copyWith({
    FetchStatus? status,
    Object? error,
    Beacon? beacon,
    List<Comment>? comments,
  }) =>
      BeaconViewState(
        error: error ?? this.error,
        status: status ?? this.status,
        beacon: beacon ?? this.beacon,
        comments: comments ?? this.comments,
      );

  @override
  BeaconViewState setError(Object error) => BeaconViewState(
        status: FetchStatus.isFailure,
        comments: comments,
        beacon: beacon,
        error: error,
      );

  @override
  BeaconViewState setLoading() => BeaconViewState(
        status: FetchStatus.isLoading,
        comments: comments,
        beacon: beacon,
      );
}
