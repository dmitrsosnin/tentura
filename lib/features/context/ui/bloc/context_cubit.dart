import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:tentura/domain/entity/repository_event.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../domain/exception.dart';
import '../../domain/entity/context.dart';
import '../../domain/use_case/context_case.dart';
import 'context_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:get_it/get_it.dart';

export 'context_state.dart';

@singleton
class ContextCubit extends Cubit<ContextState> {
  ContextCubit({
    bool fromCache = true,
    ContextCase? contextCase,
  })  : _contextCase = contextCase ?? GetIt.I<ContextCase>(),
        super(const ContextState()) {
    _contextChanges.resume();
    fetch(fromCache: fromCache);
  }

  @factoryMethod
  ContextCubit.global(this._contextCase) : super(const ContextState()) {
    _authChanges.resume();
    _contextChanges.resume();
  }

  final ContextCase _contextCase;

  late final _authChanges = _contextCase.currentAccountChanges.listen(
    (id) async {
      if (id.isNotEmpty) await fetch(fromCache: false);
    },
    cancelOnError: false,
  );

  late final _contextChanges = _contextCase.contextChanges.listen(
    (event) => switch (event) {
      final RepositoryEventCreate<Context> entity => emit(state.copyWith(
          contexts: state.contexts..add(entity.value.name),
          status: FetchStatus.isSuccess,
          error: null,
        )),
      final RepositoryEventDelete<Context> entity => emit(state.copyWith(
          contexts: state.contexts..remove(entity.id),
          status: FetchStatus.isSuccess,
          error: null,
        )),
      RepositoryEventUpdate<Context>() => throw UnimplementedError(),
    },
    cancelOnError: false,
    onError: (Object? e) =>
        emit(state.setError(e ?? const ContextUnknownException())),
  );

  @override
  @disposeMethod
  Future<void> close() async {
    await _authChanges.cancel();
    await _contextChanges.cancel();
    return super.close();
  }

  Future<void> fetch({bool fromCache = true}) async {
    emit(state.setLoading());
    try {
      final contexts = await _contextCase.fetch(fromCache: fromCache);
      emit(ContextState(
        contexts: contexts.toSet(),
        selected: state.selected,
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  String select(String contextName) {
    emit(ContextState(
      contexts: state.contexts,
      selected: contextName,
    ));
    return contextName;
  }

  Future<void> add({
    required String contextName,
    bool select = true,
  }) async {
    if (state.contexts.contains(contextName)) return;

    emit(state.setLoading());
    try {
      await _contextCase.add(contextName);
      if (select) emit(state.copyWith(selected: contextName));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> delete(String contextName) async {
    emit(state.setLoading());
    try {
      await _contextCase.delete(contextName);
      if (contextName == state.selected) {
        emit(state.copyWith(selected: ''));
      }
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
