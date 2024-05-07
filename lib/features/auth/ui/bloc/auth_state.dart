part of 'auth_cubit.dart';

final class AuthState extends StateBase {
  const AuthState({
    this.currentAccount = '',
    this.accounts = const {},
    super.status,
    super.error,
  });

  factory AuthState.fromJson(Map<dynamic, dynamic>? json) => AuthState(
        currentAccount: json?['currentAccount'] as String? ?? '',
        accounts: {
          for (final e in (json?['accounts'] as Map? ?? {}).entries)
            e.key.toString(): e.value.toString(),
        },
      );

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

  Map<String, dynamic>? toJson() => {
        'currentAccount': currentAccount,
        'accounts': accounts,
      };
}
