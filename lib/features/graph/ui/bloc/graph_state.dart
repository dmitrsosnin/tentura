part of 'graph_cubit.dart';

final class GraphState extends StateBase {
  const GraphState({
    required this.focus,
    this.isAnimated = true,
    this.positiveOnly = true,
    this.context = '',
    super.status,
    super.error,
  });

  final String focus;
  final String context;
  final bool isAnimated;
  final bool positiveOnly;

  @override
  List<Object?> get props => [
        positiveOnly,
        isAnimated,
        context,
        status,
        focus,
        error,
      ];

  @override
  GraphState copyWith({
    String? focus,
    String? context,
    bool? isAnimated,
    bool? positiveOnly,
    FetchStatus? status,
    Object? error,
  }) =>
      GraphState(
        focus: focus ?? this.focus,
        context: context ?? this.context,
        isAnimated: isAnimated ?? this.isAnimated,
        positiveOnly: positiveOnly ?? this.positiveOnly,
        status: status ?? (error == null ? this.status : FetchStatus.isFailure),
        error: error ?? this.error,
      );
}
