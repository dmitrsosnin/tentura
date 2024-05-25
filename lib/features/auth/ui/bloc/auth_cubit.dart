import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/auth_repository.dart';
import '../../domain/exception.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

//
// If code obfuscation is needed then visit
//   https://github.com/felangel/bloc/issues/3255
//
class AuthCubit extends Cubit<AuthState> with HydratedMixin<AuthState> {
  AuthCubit({
    bool trySignIn = true,
  }) : super(const AuthState()) {
    hydrate();
    if (trySignIn && isAuthenticated) signIn(state.currentAccount);
  }

  final _authRepository = GetIt.I<AuthRepository>();

  bool get isAuthenticated => state.currentAccount.isNotEmpty;

  bool get isNotAuthenticated => state.currentAccount.isEmpty;

  @override
  AuthState? fromJson(Map<String, dynamic> json) => json.isEmpty
      ? null
      : AuthState(
          currentAccount: json['currentAccount'] as String? ?? '',
          accounts: {
            for (final e in (json['accounts'] as Map? ?? {}).entries)
              e.key.toString(): e.value.toString(),
          },
        );

  @override
  Map<String, dynamic>? toJson(AuthState state) =>
      state.currentAccount == this.state.currentAccount &&
              state.accounts == this.state.accounts
          ? null
          : {
              'currentAccount': state.currentAccount,
              'accounts': state.accounts,
            };

  bool checkIfIsMe(String id) => id == state.currentAccount;

  bool checkIfIsNotMe(String id) => id != state.currentAccount;

  Future<void> addAccount(String? seed) async {
    if (seed == null) return;
    if (state.accounts.values.contains(seed)) {
      return emit(state.setError(const SeedExistsException()));
    }
    emit(state.setLoading());
    try {
      final id = await _authRepository.signIn(seed);
      emit(AuthState(
        currentAccount: id,
        accounts: {
          ...state.accounts,
          id: seed,
        },
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> signUp() async {
    emit(state.setLoading());
    try {
      final (:id, :seed) = await _authRepository.signUp();
      emit(AuthState(
        currentAccount: id,
        accounts: {
          ...state.accounts,
          id: seed,
        },
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> signIn(String id) async {
    emit(state.setLoading());
    try {
      await _authRepository.signIn(state.accounts[id]!);
      emit(AuthState(
        currentAccount: id,
        accounts: state.accounts,
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
    } finally {
      emit(AuthState(
        accounts: state.accounts,
      ));
    }
  }

  /// Remove account from local storage
  void removeAccount(String id) {
    state.accounts.remove(id);
    emit(AuthState(
      accounts: {...state.accounts},
      currentAccount: state.currentAccount,
    ));
  }

  /// Remove account from remote server and local storage
  Future<void> deleteAccount(String id) async {
    emit(state.setLoading());
    try {
      await _authRepository.delete();
      state.accounts.remove(id);
      emit(AuthState(
        accounts: {...state.accounts},
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
