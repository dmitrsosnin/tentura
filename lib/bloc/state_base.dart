import 'package:equatable/equatable.dart';

import 'bloc_data_status.dart';

abstract class StateBase extends Equatable {
  final BlocDataStatus status;
  final Object? error;

  const StateBase({
    this.status = BlocDataStatus.isInitial,
    this.error,
  });

  @override
  List<Object?> get props => [
        status,
        error,
      ];

  bool get isInitial => status == BlocDataStatus.isInitial;

  bool get isLoading => status == BlocDataStatus.isLoading;

  bool get hasData => status == BlocDataStatus.hasData;

  bool get hasError => status == BlocDataStatus.hasError;
}
