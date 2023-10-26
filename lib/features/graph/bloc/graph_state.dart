part of 'graph_cubit.dart';

final class GraphState extends Equatable {
  const GraphState({
    required this.focus,
    this.positiveOnly = true,
    this.status = FetchStatus.isEmpty,
    this.error,
  });

  final String focus;
  final bool positiveOnly;
  final FetchStatus status;
  final Object? error;

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
