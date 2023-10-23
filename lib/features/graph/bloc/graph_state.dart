part of 'graph_cubit.dart';

final class GraphState extends Equatable {
  const GraphState({
    required this.focus,
    this.status = FetchStatus.isEmpty,
    this.error,
  });

  final String focus;
  final FetchStatus status;
  final Object? error;

  GraphState copyWith({
    String? focus,
    FetchStatus? status,
    Object? error,
  }) =>
      GraphState(
        focus: focus ?? this.focus,
        error: error ?? this.error,
        status: status ?? (error == null ? this.status : FetchStatus.hasError),
      );

  @override
  List<Object?> get props => [
        status,
        error,
      ];
}
