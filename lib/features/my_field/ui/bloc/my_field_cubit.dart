import 'dart:async';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/domain/entity/beacon.dart';

import '../../data/my_field_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  MyFieldCubit({
    required MyFieldRepository repository,
  })  : _repository = repository,
        super(const MyFieldState()) {
    _repository.authenticationStatus.firstWhere((e) => e).then((e) => fetch());
  }

  final MyFieldRepository _repository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      final beacons = await _repository.fetchMyField();
      emit(MyFieldState(
        // TBD: remove that ugly 'where' when able filter in request
        beacons: beacons.where((e) => e.enabled).toList(),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<int> vote({
    required int amount,
    required String beaconId,
  }) async {
    final beacon = await _repository.vote(id: beaconId, amount: amount);
    return beacon.my_vote ?? 0;
  }
}
