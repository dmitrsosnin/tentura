import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../domain/use_case/liked_beacons_case.dart';
import 'liked_beacons_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'liked_beacons_state.dart';

@lazySingleton
class LikedBeaconsCubit extends Cubit<LikedBeaconsState> {
  LikedBeaconsCubit(this._likedBeaconsCase) : super(const LikedBeaconsState()) {
    _authChanges.resume();
    _likeChanges.resume();
  }

  final LikedBeaconsCase _likedBeaconsCase;

  late final _authChanges = _likedBeaconsCase.currentAccountChanges.listen(
    (userId) async {
      emit(const LikedBeaconsState());
      if (userId.isNotEmpty) await fetch(state.context);
    },
    cancelOnError: false,
  );

  late final _likeChanges = _likedBeaconsCase.likeChanges.listen(
    (beacon) {
      state.beacons.removeWhere((e) => e.id == beacon.id);
      if (beacon.myVote > 0) state.beacons.add(beacon);
      emit(LikedBeaconsState(beacons: state.beacons));
    },
    cancelOnError: false,
  );

  @override
  @disposeMethod
  Future<void> close() async {
    await _authChanges.cancel();
    await _likeChanges.cancel();
    return super.close();
  }

  Future<void> fetch([String contextName = '']) async {
    emit(state.setLoading());
    try {
      final beacons = await _likedBeaconsCase.fetch(contextName);
      emit(LikedBeaconsState(
        context: contextName,
        beacons: beacons.toList(),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
