part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.currentAccount = '',
    this.accounts = const {},
    this.isLoading = false,
    this.error,
  });

  factory AuthState.fromJson(Map<String, dynamic> json) => AuthState(
        currentAccount: json['currentAccount'] as String? ?? '',
        accounts: json['accounts'] as Map<String, String>? ?? {},
      );

  final Object? error;

  final bool isLoading;

  final String currentAccount;

  // id:seed(base64)
  final Map<String, String> accounts;

  @override
  List<Object?> get props => [
        isLoading,
        currentAccount,
        error,
        accounts,
      ];

  Map<String, dynamic>? toJson(AuthState state) =>
      state.currentAccount == currentAccount &&
              mapEquals(state.accounts, accounts)
          ? null
          : {
              'accounts': accounts,
              'currentAccount': currentAccount,
            };

  bool checkIfIsMe(String id) => id == currentAccount;

  bool checkIfIsNotMe(String id) => id != currentAccount;

  AuthState setError(Object error) => AuthState(
        error: error,
        accounts: accounts,
        currentAccount: currentAccount,
      );

  AuthState setLoading() => AuthState(
        isLoading: true,
        accounts: accounts,
        currentAccount: currentAccount,
      );
}
