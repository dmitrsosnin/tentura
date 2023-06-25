import 'package:equatable/equatable.dart';

enum BlocDataStatus { isInitial, isLoading, hasData, hasError }

class StateBase extends Equatable {
  final BlocDataStatus status;
  final String navigateTo;
  final Object? error;

  const StateBase({
    this.status = BlocDataStatus.isInitial,
    this.navigateTo = '',
    this.error,
  });

  @override
  List<Object> get props => [
        status,
        navigateTo,
        error ?? '',
      ];

  bool get isInitial => status == BlocDataStatus.isInitial;

  bool get isLoading => status == BlocDataStatus.isLoading;

  bool get hasData => status == BlocDataStatus.hasData;

  bool get hasError => status == BlocDataStatus.hasError;

  StateBase copyWith({
    BlocDataStatus? status,
    String? navigateTo,
    Object? error,
    bool clearError = false,
  }) =>
      StateBase(
        status: status ?? this.status,
        navigateTo: navigateTo ?? this.navigateTo,
        error: clearError ? null : error ?? this.error,
      );
}
