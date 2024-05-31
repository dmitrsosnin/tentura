import 'dart:async';

import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/my_field_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:tentura/data/gql/gql_client.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  MyFieldCubit({
    required this.id,
    required this.myFieldRepository,
    bool needFetch = true,
  }) : super(const MyFieldState()) {
    if (needFetch) fetch();
  }

  final String id;

  final MyFieldRepository myFieldRepository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      final beacons = await myFieldRepository.fetchFieldOf(id);
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
    final beacon = await myFieldRepository.vote(id: beaconId, amount: amount);
    return beacon.my_vote ?? 0;
  }
}
