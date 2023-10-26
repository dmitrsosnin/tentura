part of 'stats_bloc.dart';

final class StatsState extends StateBase {
  const StatsState({
    this.isSortedByDesc = true,
    super.status = FetchStatus.isEmpty,
    super.error,
  });

  final bool isSortedByDesc;

  @override
  StatsState copyWith({
    String? focus,
    bool? isSortedByDesc,
    FetchStatus? status,
    Object? error,
  }) =>
      StatsState(
        isSortedByDesc: isSortedByDesc ?? this.isSortedByDesc,
        status: status ?? (error == null ? this.status : FetchStatus.hasError),
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        status,
        error,
      ];
}
