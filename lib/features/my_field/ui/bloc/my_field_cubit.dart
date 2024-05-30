import 'dart:async';

import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/domain/entity/beacon.dart';

import '../../data/my_field_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  MyFieldCubit({
    required this.id,
    bool needFetch = true,
    MyFieldRepository? myFieldRepository,
  })  : _myFieldRepository = myFieldRepository ?? MyFieldRepository(),
        super(const MyFieldState()) {
    if (needFetch) fetch();
  }

  final String id;

  final MyFieldRepository _myFieldRepository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      final beacons = await _myFieldRepository.fetchFieldOf(id);
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
    final beacon = await _myFieldRepository.vote(id: beaconId, amount: amount);
    return beacon.my_vote ?? 0;
  }
}
