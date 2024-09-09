part of 'auth_cubit.dart';

final class AuthState extends StateBase {
  const AuthState({
    this.currentAccountId = '',
    this.accounts = const {},
    super.status,
    super.error,
  });

  final String currentAccountId;
  final Set<Account> accounts;

  @override
  List<Object?> get props => [
        currentAccountId,
        accounts,
        status,
        error,
      ];

  bool get isAuthenticated => currentAccountId.isNotEmpty;

  bool get isNotAuthenticated => currentAccountId.isEmpty;

  Account? get currentAccount =>
      accounts.singleWhereOrNull((e) => e.id == currentAccountId);

  @override
  AuthState copyWith({
    String? currentAccountId,
    Set<Account>? accounts,
    FetchStatus? status,
    Object? error,
  }) =>
      AuthState(
        currentAccountId: currentAccountId ?? this.currentAccountId,
        accounts: accounts ?? this.accounts,
        status: status ?? this.status,
        error: error ?? this.error,
      );

  @override
  AuthState setError(Object error) => AuthState(
        accounts: accounts,
        currentAccountId: currentAccountId,
        status: FetchStatus.isFailure,
        error: error,
      );

  @override
  AuthState setLoading() => AuthState(
        accounts: accounts,
        currentAccountId: currentAccountId,
        status: FetchStatus.isLoading,
      );
}
