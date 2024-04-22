import 'package:equatable/equatable.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:hydrated_bloc/hydrated_bloc.dart';

enum FetchStatus { isEmpty, isLoading, hasData, hasError }

base class StateBase extends Equatable {
  const StateBase({
    this.status = FetchStatus.isEmpty,
    this.error,
  });

  final FetchStatus status;
  final Object? error;

  bool get isEmpty => status == FetchStatus.isEmpty;
  bool get isLoading => status == FetchStatus.isLoading;
  bool get hasData => status == FetchStatus.hasData;
  bool get hasError => error != null || status == FetchStatus.hasError;

  StateBase copyWith({
    FetchStatus? status,
    Object? error,
  }) =>
      StateBase(
        status: status ?? (error == null ? this.status : FetchStatus.hasError),
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        status,
        error,
      ];
}
