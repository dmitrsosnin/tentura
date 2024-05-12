import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:tentura/data/repository/keychain_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:hydrated_bloc/hydrated_bloc.dart';

enum FetchStatus { isLoading, isSuccess, isFailure }

extension FetchStatusX on FetchStatus {
  bool get isLoading => this == FetchStatus.isLoading;
  bool get isSuccess => this == FetchStatus.isSuccess;
  bool get isFailure => this == FetchStatus.isFailure;
}

abstract base class StateBase with EquatableMixin {
  static Future<void> init({
    List<int>? key,
    Directory? storageDirectory,
  }) async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory:
          storageDirectory ?? await getApplicationDocumentsDirectory(),
      encryptionCipher: HydratedAesCipher(
          key ?? await GetIt.I<KeychainRepository>().getSeed()),
    );
  }

  static Future<void> close() => HydratedBloc.storage.close();

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
