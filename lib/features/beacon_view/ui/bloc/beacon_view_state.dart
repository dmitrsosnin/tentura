part of 'beacon_view_cubit.dart';

final class BeaconViewState extends StateBase {
  const BeaconViewState({
    required this.beacon,
    this.focusCommentId = '',
    this.comments = const [],
    this.initiallyExpanded = false,
    super.status,
    super.error,
  });

  final Beacon beacon;
  final String focusCommentId;
  final List<Comment> comments;
  final bool initiallyExpanded;

  @override
  List<Object?> get props => [
        status,
        error,
        beacon,
        comments,
        focusCommentId,
        initiallyExpanded,
      ];

  bool get hasFocusedComment => focusCommentId.isNotEmpty;

  @override
  BeaconViewState copyWith({
    FetchStatus? status,
    Object? error,
    Beacon? beacon,
    String? focusCommentId,
    List<Comment>? comments,
    bool? initiallyExpanded,
  }) =>
      BeaconViewState(
        error: error ?? this.error,
        status: status ?? this.status,
        beacon: beacon ?? this.beacon,
        comments: comments ?? this.comments,
        focusCommentId: focusCommentId ?? this.focusCommentId,
        initiallyExpanded: initiallyExpanded ?? this.initiallyExpanded,
      );

  @override
  BeaconViewState setError(Object error) => BeaconViewState(
        status: FetchStatus.isFailure,
        initiallyExpanded: initiallyExpanded,
        focusCommentId: focusCommentId,
        comments: comments,
        beacon: beacon,
        error: error,
      );

  @override
  BeaconViewState setLoading() => BeaconViewState(
        status: FetchStatus.isLoading,
        initiallyExpanded: initiallyExpanded,
        focusCommentId: focusCommentId,
        comments: comments,
        beacon: beacon,
      );
}
