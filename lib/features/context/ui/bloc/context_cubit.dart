import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/context_repository.dart';
import 'context_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'context_state.dart';

class ContextCubit extends Cubit<ContextState> {
  ContextCubit({
    ContextRepository? repository,
  })  : _repository = repository ?? GetIt.I<ContextRepository>(),
        super(const ContextState()) {
    _fetchSubscription.resume();
  }

  final ContextRepository _repository;

  late final _fetchSubscription = _repository.stream.listen(
    (e) => emit(state.copyWith(contexts: e.toSet())),
    onError: (Object e) => emit(state.setError(e.toString())),
    cancelOnError: false,
  );

  @override
  Future<void> close() async {
    await _fetchSubscription.cancel();
    return super.close();
  }

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      await _repository.fetch();
    } catch (e) {
      emit(state.setError(e));
    }
  }

  String select(String contextName) {
    emit(ContextState(
      selected: contextName,
      contexts: state.contexts,
    ));
    return contextName;
  }

  Future<bool> add({
    required String name,
    required bool select,
  }) async {
    if (state.contexts.contains(name)) return false;
    try {
      final context = await _repository.add(name);
      if (context == null) {
        throw Exception('Could not add context [$name]');
      }
      emit(ContextState(
        selected: context,
        contexts: {
          context,
          ...state.contexts,
        },
      ));
    } catch (e) {
      emit(state.setError(e));
    }
    return true;
  }

  /// Returns `true` if current context deleted
  Future<bool> delete(String contextName) async {
    final isCurrent = state.selected == contextName;
    try {
      await _repository.delete(contextName);
      state.contexts.remove(contextName);
      emit(ContextState(
        contexts: {...state.contexts},
        selected: isCurrent ? '' : state.selected,
      ));
    } catch (e) {
      emit(state.setError(e));
    }
    return isCurrent;
  }
}
