part of 'beacon_view_cubit.dart';

final class BeaconViewState extends StateBase {
  const BeaconViewState({
    required this.beacon,
    this.focusCommentId = '',
    this.comments = const [],
    super.status,
    super.error,
  });

  final Beacon beacon;
  final String focusCommentId;
  final List<Comment> comments;

  @override
  List<Object?> get props => [
        status,
        error,
        beacon,
        comments,
        focusCommentId,
      ];

  bool get hasFocusedComment => focusCommentId.isNotEmpty;
  bool get hasNoFocusedComment => focusCommentId.isEmpty;

  @override
  BeaconViewState copyWith({
    FetchStatus? status,
    Object? error,
    Beacon? beacon,
    String? focusCommentId,
    List<Comment>? comments,
  }) =>
      BeaconViewState(
        error: error ?? this.error,
        status: status ?? this.status,
        beacon: beacon ?? this.beacon,
        comments: comments ?? this.comments,
        focusCommentId: focusCommentId ?? this.focusCommentId,
      );

  @override
  BeaconViewState setError(Object error) => BeaconViewState(
        status: FetchStatus.isFailure,
        focusCommentId: focusCommentId,
        comments: comments,
        beacon: beacon,
        error: error,
      );

  @override
  BeaconViewState setLoading() => BeaconViewState(
        status: FetchStatus.isLoading,
        focusCommentId: focusCommentId,
        comments: comments,
        beacon: beacon,
      );
}
