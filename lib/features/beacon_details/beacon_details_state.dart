part of 'beacon_details_cubit.dart';

class BeaconDetailsState extends StateBase {
  final Beacon beacon;
  final List<Comment> comments;

  const BeaconDetailsState({
    required this.beacon,
    this.comments = const [],
  });

  @override
  List<Object?> get props => [
        status,
        error,
        beacon,
        comments,
      ];

  BeaconDetailsState copyWith({
    List<Comment>? comments,
  }) =>
      BeaconDetailsState(
        beacon: beacon,
        comments: comments ?? this.comments,
      );
}
