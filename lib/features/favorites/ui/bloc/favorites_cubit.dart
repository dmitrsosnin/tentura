import 'dart:async';
import 'package:get_it/get_it.dart';

import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';

import '../../data/favorites_repository.dart';
import 'favorites_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required String userId,
    FavoritesRepository? repository,
  })  : _repository = repository ?? GetIt.I<FavoritesRepository>(),
        super(FavoritesState(userId: userId)) {
    fetch();
  }

  final FavoritesRepository _repository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      emit(FavoritesState(
        beacons: (await _repository.fetch()).toList(),
        userId: state.userId,
      ));
    } catch (e) {
      emit(state.setError(e.toString()));
    }
  }

  Future<Beacon> pin(Beacon beacon) async {
    try {
      await _repository.pin(beacon.id);
      emit(FavoritesState(
        beacons: [...state.beacons, beacon],
        userId: state.userId,
      ));
      return beacon.copyWith(isPinned: true);
    } catch (e) {
      emit(state.setError(e.toString()));
      rethrow;
    }
  }

  Future<Beacon> unpin(Beacon beacon) async {
    try {
      await _repository.unpin(
        beaconId: beacon.id,
        userId: state.userId,
      );
      final beacons = [...state.beacons]..removeWhere((e) => e.id == beacon.id);
      emit(FavoritesState(
        beacons: beacons,
        userId: state.userId,
      ));
      return beacon.copyWith(isPinned: false);
    } catch (e) {
      emit(state.setError(e.toString()));
      rethrow;
    }
  }
}
