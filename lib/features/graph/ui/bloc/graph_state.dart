part of 'graph_cubit.dart';

final class GraphState extends StateBase {
  const GraphState({
    required this.focus,
    this.isAnimated = true,
    this.positiveOnly = true,
    super.status,
    super.error,
  });

  final String focus;
  final bool isAnimated;
  final bool positiveOnly;

  @override
  List<Object?> get props => [
        positiveOnly,
        isAnimated,
        status,
        focus,
        error,
      ];

  @override
  GraphState copyWith({
    String? focus,
    bool? isAnimated,
    bool? positiveOnly,
    FetchStatus? status,
    Object? error,
  }) =>
      GraphState(
        focus: focus ?? this.focus,
        isAnimated: isAnimated ?? this.isAnimated,
        positiveOnly: positiveOnly ?? this.positiveOnly,
        status: status ?? (error == null ? this.status : FetchStatus.isFailure),
        error: error ?? this.error,
      );
}
