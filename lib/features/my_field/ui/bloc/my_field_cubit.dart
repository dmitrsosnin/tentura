import 'dart:async';
import 'package:get_it/get_it.dart';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/domain/entity/beacon.dart';

import '../../data/my_field_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  MyFieldCubit({MyFieldRepository? repository})
      : _repository = repository ?? GetIt.I<MyFieldRepository>(),
        super(const MyFieldState()) {
    fetch('');
  }

  final MyFieldRepository _repository;

  Future<void> fetch(String contextName) async {
    emit(state.setLoading());
    try {
      final beacons = await _repository.fetch(context: contextName);
      emit(MyFieldState(
        context: contextName,
        beacons: beacons.toList(),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
