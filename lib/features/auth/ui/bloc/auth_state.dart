import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:tentura/ui/bloc/state_base.dart';

import '../../domain/entity/account.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState, StateMixin {
  const factory AuthState({
    @Default('') String currentAccountId,
    @Default({}) Set<Account> accounts,
    @Default(FetchStatus.isSuccess) FetchStatus status,
    Object? error,
  }) = _AuthState;

  const AuthState._();

  bool get isAuthenticated => currentAccountId.isNotEmpty;

  bool get isNotAuthenticated => currentAccountId.isEmpty;

  Account? get currentAccount =>
      accounts.singleWhereOrNull((e) => e.id == currentAccountId);

  AuthState setError(Object error) => copyWith(
        status: FetchStatus.isFailure,
        error: error,
      );

  AuthState setLoading() => copyWith(
        status: FetchStatus.isLoading,
      );
}
