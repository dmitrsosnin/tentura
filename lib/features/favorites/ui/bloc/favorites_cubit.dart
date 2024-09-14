import 'dart:async';
import 'package:get_it/get_it.dart';

import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/favorites_repository.dart';
import 'favorites_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required this.userId,
    FavoritesRepository? repository,
  })  : _repository = repository ?? GetIt.I<FavoritesRepository>(),
        super(const FavoritesState());

  final String userId;

  final FavoritesRepository _repository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      emit(FavoritesState(beacons: (await _repository.fetch()).toList()));
    } catch (e) {
      emit(state.setError(e.toString()));
    }
  }

  Future<Beacon> pin(String beaconId) async {
    final beacon = await _repository.pin(beaconId);
    emit(FavoritesState(
      beacons: [...state.beacons, beacon],
    ));
    return beacon;
  }

  Future<Beacon> unpin(String beaconId) async {
    final beacon = _repository.unpin(beaconId: beaconId, userId: userId);
    final beacons = [...state.beacons]..removeWhere((e) => e.id == beaconId);
    emit(FavoritesState(beacons: beacons));
    return beacon;
  }
}
