import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/auth_service.dart';
import '../../domain/exception.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

// TBD: if code obfuscation is needed then visit
//   https://github.com/felangel/bloc/issues/3255
class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit({
    AuthService? authRepository,
  })  : _authService = authRepository ?? AuthService(),
        super(const AuthState());

  final AuthService _authService;

  Future<String> get accessToken => _authService.accessToken;

  @override
  AuthState? fromJson(Map<String, dynamic> json) =>
      json.isEmpty ? null : AuthState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(AuthState state) => this.state.toJson(state);

  @override
  Future<void> close() async {
    await _authService.close();
    return super.close();
  }

  Future<AuthCubit> init() async {
    hydrate();
    if (state.isAuthenticated) await signIn(id);
    return this;
  }

  Future<void> addAccount(String? seed) async {
    if (seed == null) return;
    if (state.accounts.values.contains(seed)) {
      return emit(state.copyWith(
        error: const SeedExistsException(),
      ));
    }
    emit(state.copyWith(status: FetchStatus.isLoading));
    try {
      final id = await _authService.signIn(seed);
      emit(state.addAccount(id, seed));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> signUp() async {
    emit(state.copyWith(status: FetchStatus.isLoading));
    try {
      final (:id, :seed) = await _authService.signUp();
      emit(state.addAccount(id, seed));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> signIn(String id) async {
    emit(state.copyWith(status: FetchStatus.isLoading));
    try {
      await _authService.signIn(state.accounts[id]!);
      emit(state.copyWith(
        status: FetchStatus.hasData,
        currentAccount: id,
      ));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
    } finally {
      emit(state.copyWith(
        status: FetchStatus.hasData,
        currentAccount: '',
      ));
    }
  }

  /// Remove account from local storage
  void removeAccount(String id) => emit(state.removeAccount(id));

  /// Remove account from remote server and local storage
  Future<void> deleteAccount(String id) async {
    emit(state.copyWith(status: FetchStatus.isLoading));
    try {
      await _authService.delete();
      removeAccount(id);
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }
}
