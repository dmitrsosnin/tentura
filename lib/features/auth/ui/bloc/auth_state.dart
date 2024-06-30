part of 'auth_cubit.dart';

final class AuthState extends StateBase {
  const AuthState({
    this.currentAccount = '',
    this.accounts = const {},
    super.status,
    super.error,
  });

  final String currentAccount;

  // id:seed(base64)
  final Map<String, String> accounts;

  @override
  List<Object?> get props => [
        currentAccount,
        accounts,
        status,
        error,
      ];

  bool get isAuthenticated => currentAccount.isNotEmpty;

  bool get isNotAuthenticated => currentAccount.isEmpty;

  @override
  AuthState copyWith({
    String? currentAccount,
    Map<String, String>? accounts,
    FetchStatus? status,
    Object? error,
  }) =>
      AuthState(
        currentAccount: currentAccount ?? this.currentAccount,
        accounts: accounts ?? this.accounts,
        status: status ?? this.status,
        error: error ?? this.error,
      );

  @override
  AuthState setError(Object error) => AuthState(
        accounts: accounts,
        currentAccount: currentAccount,
        status: FetchStatus.isFailure,
        error: error,
      );

  @override
  AuthState setLoading() => AuthState(
        accounts: accounts,
        currentAccount: currentAccount,
        status: FetchStatus.isLoading,
      );
}
