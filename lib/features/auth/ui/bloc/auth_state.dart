part of 'auth_cubit.dart';

final class AuthState extends StateBase {
  const AuthState({
    this.currentAccount = '',
    this.accounts = const {},
    super.status = FetchStatus.isEmpty,
    super.error,
  });

  factory AuthState.fromJson(Map<String, dynamic> json) => AuthState(
        currentAccount: json['currentAccount'] as String? ?? '',
        accounts: json['accounts'] as Map<String, String>? ?? {},
        status: FetchStatus.hasData,
      );

  final String currentAccount;

  // id:seed(base64)
  final Map<String, String> accounts;

  bool get isAuthenticated => currentAccount.isNotEmpty;

  @override
  AuthState copyWith({
    Object? error,
    FetchStatus? status,
    String? currentAccount,
    Map<String, String>? accounts,
  }) =>
      AuthState(
        error: error ?? this.error,
        status: status ?? (error == null ? this.status : FetchStatus.hasError),
        currentAccount: currentAccount ?? this.currentAccount,
        accounts: accounts ?? this.accounts,
      );

  @override
  List<Object?> get props => [
        error,
        status,
        accounts,
        currentAccount,
      ];

  Map<String, dynamic>? toJson(AuthState state) =>
      state.currentAccount == currentAccount && state.accounts == accounts
          ? null
          : {
              'currentAccount': state.currentAccount,
              'accounts': state.accounts,
            };

  bool checkIfIsMe(String id) => id == currentAccount;

  bool checkIfIsNotMe(String id) => id != currentAccount;

  AuthState addAccount(String id, String seed) => AuthState(
        status: FetchStatus.hasData,
        accounts: {...accounts, id: seed},
        currentAccount: id,
      );

  AuthState removeAccount(String id) {
    accounts.remove(id);
    return copyWith(
      status: FetchStatus.hasData,
      accounts: {...accounts},
    );
  }
}
