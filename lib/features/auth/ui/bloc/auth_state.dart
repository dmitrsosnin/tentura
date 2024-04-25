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
        status,
        error,
        accounts,
      ];

  Map<String, dynamic>? toJson(AuthState state) => {
        'currentAccount': currentAccount,
        'accounts': accounts,
      };

  bool checkIfIsMe(String id) => id == currentAccount;

  bool checkIfIsNotMe(String id) => id != currentAccount;

  AuthState copyWith({
    String? currentAccount,
    Map<String, String>? accounts,
  }) =>
      AuthState(
        currentAccount: currentAccount ?? this.currentAccount,
        accounts: accounts ?? this.accounts,
      );

  AuthState setError(Object error) => AuthState(
        error: error,
        accounts: accounts,
        currentAccount: currentAccount,
        status: FetchStatus.isFailure,
      );

  AuthState setLoading() => AuthState(
        accounts: accounts,
        currentAccount: currentAccount,
        status: FetchStatus.isLoading,
      );
}
