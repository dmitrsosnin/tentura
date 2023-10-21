part of 'graph_cubit.dart';

final class GraphState extends Equatable {
  const GraphState({
    this.status = FetchStatus.isEmpty,
    this.error,
  });

  final FetchStatus status;
  final Object? error;

  GraphState copyWith({
    FetchStatus? status,
    Object? error,
  }) =>
      GraphState(
        error: error ?? this.error,
        status: status ?? (error == null ? this.status : FetchStatus.hasError),
      );

  @override
  List<Object?> get props => [
        status,
        error,
      ];
}
