part of 'graph_cubit.dart';

final class GraphState extends StateBase {
  const GraphState({
    required this.focus,
    this.positiveOnly = true,
    super.status = FetchStatus.isEmpty,
    super.error,
  });

  final String focus;
  final bool positiveOnly;

  @override
  GraphState copyWith({
    String? focus,
    bool? positiveOnly,
    FetchStatus? status,
    Object? error,
  }) =>
      GraphState(
        focus: focus ?? this.focus,
        positiveOnly: positiveOnly ?? this.positiveOnly,
        status: status ?? (error == null ? this.status : FetchStatus.hasError),
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        positiveOnly,
        status,
        focus,
        error,
      ];
}
