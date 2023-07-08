import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/_shared/bloc/state_base.dart';
import 'package:gravity/_shared/bloc/bloc_data_status.dart';
import 'package:gravity/auth/data/auth_repository.dart';

import 'package:gravity/beacon/entity/beacon.dart';
import 'package:gravity/beacon/data/beacon_repository.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_beacons_page_state.dart';

class MyBeaconsPageCubit extends Cubit<MyBeaconsPageState> {
  MyBeaconsPageCubit() : super(const MyBeaconsPageState()) {
    _updates.resume();
    refresh(useCache: true);
  }

  final _authRepository = GetIt.I<AuthRepository>();
  final _beaconRepository = GetIt.I<BeaconRepository>();

  late final _updates = _beaconRepository.updates.listen((beacon) {
    emit(
      MyBeaconsPageState(
        beacons: [beacon, ...state.beacons],
        status: BlocDataStatus.hasData,
      ),
    );
  });

  @override
  Future<void> close() async {
    await _updates.cancel();
    await super.close();
  }

  Future<void> refresh({bool useCache = false}) async {
    emit(
      state.copyWith(
        status: BlocDataStatus.isLoading,
      ),
    );
    final beacons = await _beaconRepository.getBeaconsByUserId(
      _authRepository.myId,
      useCache: useCache,
    );
    beacons.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    emit(
      MyBeaconsPageState(
        beacons: beacons,
        status: BlocDataStatus.hasData,
      ),
    );
  }
}
