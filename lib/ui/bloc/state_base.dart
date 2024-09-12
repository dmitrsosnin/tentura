import 'package:equatable/equatable.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

enum FetchStatus { isLoading, isSuccess, isFailure }

extension FetchStatusX on FetchStatus {
  bool get isLoading => this == FetchStatus.isLoading;
  bool get isSuccess => this == FetchStatus.isSuccess;
  bool get isFailure => this == FetchStatus.isFailure;
}

mixin StateMixin {
  FetchStatus get status;
  Object? get error;

  bool get isLoading => status.isLoading;
  bool get isNotLoading => !status.isLoading;

  bool get hasError => error != null || status.isFailure;
  bool get hasNoError => error == null && status.isSuccess;
}

abstract class StateBase with EquatableMixin {
  const StateBase({
    this.status = FetchStatus.isSuccess,
    this.error,
  });

  final FetchStatus status;
  final Object? error;

  @override
  List<Object?> get props => [
        status,
        error,
      ];

  bool get isLoading => status.isLoading;
  bool get isNotLoading => !status.isLoading;

  bool get hasError => error != null || status.isFailure;
  bool get hasNoError => error == null && status.isSuccess;

  StateBase setError(Object error) => copyWith(
        status: FetchStatus.isFailure,
        error: error,
      );

  StateBase setLoading() => copyWith(
        status: FetchStatus.isLoading,
      );

  StateBase copyWith({
    FetchStatus? status,
    Object? error,
  });
}
