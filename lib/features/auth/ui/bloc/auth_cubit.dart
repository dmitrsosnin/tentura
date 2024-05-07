import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/auth_service.dart';
import '../../domain/exception.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

//
// If code obfuscation is needed then visit https://github.com/felangel/bloc/issues/3255
//
class AuthCubit extends Cubit<AuthState> with HydratedMixin<AuthState> {
  AuthCubit({
    AuthService? authService,
  })  : _authService = authService ?? AuthService(),
        super(const AuthState()) {
    hydrate();
  }

  final AuthService _authService;

  bool get isAuthenticated => state.currentAccount.isNotEmpty;

  bool get isNotAuthenticated => state.currentAccount.isEmpty;

  Future<String> get accessToken => _authService.accessToken;

  @override
  AuthState fromJson(Map<String, dynamic> json) => AuthState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();

  @override
  Future<void> close() async {
    await _authService.close();
    return super.close();
  }

  Future<AuthCubit> init({bool trySignIn = true}) async {
    if (trySignIn && isAuthenticated) await signIn(state.currentAccount);
    return this;
  }

  bool checkIfIsMe(String id) => id == state.currentAccount;

  bool checkIfIsNotMe(String id) => id != state.currentAccount;

  Future<void> addAccount(String? seed) async {
    if (seed == null) return;
    if (state.accounts.values.contains(seed)) {
      return emit(state.setError(const SeedExistsException()));
    }
    emit(state.setLoading());
    try {
      final id = await _authService.signIn(seed);
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
      final (:id, :seed) = await _authService.signUp();
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
      await _authService.signIn(state.accounts[id]!);
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
      await _authService.signOut();
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
      await _authService.delete();
      state.accounts.remove(id);
      emit(AuthState(
        accounts: {...state.accounts},
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
