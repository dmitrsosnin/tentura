import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/_shared/bloc/state_base.dart';
import 'package:gravity/_shared/bloc/bloc_data_status.dart';

import 'package:gravity/beacon/entity/beacon.dart';
import 'package:gravity/beacon/data/beacon_repository.dart';

part 'beacon_search_state.dart';

class BeaconSearchCubit extends Cubit<BeaconSearchState> {
  BeaconSearchCubit() : super(const BeaconSearchState());

  final _beaconRepository = GetIt.I<BeaconRepository>();

  Future<void> searchBeaconById(String value) async {
    if (value.length < 3) {
      emit(const BeaconSearchState());
      return;
    }
    emit(state.copyWith(
      searchQuery: value,
      status: BlocDataStatus.isLoading,
    ));
    try {
      emit(state.copyWith(
        clearError: true,
        status: BlocDataStatus.hasData,
        beacons: await _beaconRepository.getBeaconsByIdPrefix(value),
      ));
    } catch (e) {
      if (kDebugMode) print(e);
      emit(state.copyWith(
        error: e,
        status: BlocDataStatus.hasError,
      ));
    }
  }
}
