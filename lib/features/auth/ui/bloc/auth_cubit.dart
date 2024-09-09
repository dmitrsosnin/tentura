import 'package:collection/collection.dart';

import 'package:tentura/domain/entity/exception.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../domain/entity/account.dart';
import '../../domain/use_case/auth_case.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static Future<AuthCubit> hydrated(AuthCase authCase) async => AuthCubit(
        authCase: authCase,
        state: AuthState(
          currentAccountId: await authCase.getCurrentAccountId(),
          accounts: await authCase.getAccountAll(),
        ),
      );

  AuthCubit({
    required AuthCase authCase,
    AuthState state = const AuthState(),
  })  : _authCase = authCase,
        super(state) {
    if (state.isAuthenticated) {
      emit(state.setLoading());
      try {
        _authCase.signIn(
          state.currentAccountId,
          isPpremature: true,
        );
      } catch (e) {
        emit(state.setError(e));
      }
    }
  }

  final AuthCase _authCase;

  bool checkIfIsMe(String id) => id == state.currentAccountId;

  bool checkIfIsNotMe(String id) => id != state.currentAccountId;

  String getSeedByAccountId(String id) =>
      state.accounts.firstWhereOrNull((e) => e.id == id)?.seed ?? '';

  Future<void> addAccount(String? seed) async {
    if (seed == null) return;
    if (state.accounts.any((e) => e.seed == seed)) {
      return emit(state.setError(const SeedExistsException()));
    }
    emit(state.setLoading());
    try {
      final account = await _authCase.addAccount(seed);
      emit(AuthState(
        currentAccountId: account.id,
        accounts: {
          ...state.accounts,
          Account(id: account.id, seed: seed),
        },
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> signUp() async {
    emit(state.setLoading());
    try {
      final account = await _authCase.signUp();
      emit(AuthState(
        currentAccountId: account.id,
        accounts: {
          ...state.accounts,
          account,
        },
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> signIn(String id) async {
    emit(state.setLoading());
    try {
      final account = await _authCase.signIn(id);
      emit(AuthState(
        accounts: state.accounts,
        currentAccountId: account.id,
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> signOut({bool willEmit = true}) async {
    try {
      await _authCase.signOut();
    } catch (e) {
      emit(state.setError(e));
    } finally {
      if (willEmit) emit(AuthState(accounts: state.accounts));
    }
  }

  /// Remove account from local storage
  Future<void> removeAccount(String id) async {
    try {
      await _authCase.removeAccount(id);
    } catch (e) {
      emit(state.setError(e));
    } finally {
      state.accounts.removeWhere((e) => e.id == id);
      emit(AuthState(accounts: {...state.accounts}));
    }
  }
}
