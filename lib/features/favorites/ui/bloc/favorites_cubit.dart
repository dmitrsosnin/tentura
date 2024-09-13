import 'dart:async';
import 'package:get_it/get_it.dart';

import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/favorites_repository.dart';
import 'favorites_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({FavoritesRepository? repository})
      : _repository = repository ?? GetIt.I<FavoritesRepository>(),
        super(const FavoritesState()) {
    _fetchSubscription.resume();
  }

  final FavoritesRepository _repository;

  late final _fetchSubscription = _repository.stream.listen(
    (e) => emit(FavoritesState(beacons: e.toList())),
    onError: (Object e) => emit(state.setError(e.toString())),
    cancelOnError: false,
  );

  @override
  Future<void> close() async {
    await _fetchSubscription.cancel();
    return super.close();
  }

  Future<void> fetch() async {
    emit(state.setLoading());
    return _repository.fetch();
  }

  Future<Beacon> pin(String beaconId) async {
    final beacon = await _repository.pin(beaconId);
    emit(FavoritesState(
      beacons: [
        ...state.beacons,
        beacon,
      ],
    ));
    return beacon;
  }

  Future<Beacon> unpin(String beaconId) async {
    final beacon = _repository.unpin(beaconId);
    final beacons = [...state.beacons]..removeWhere((e) => e.id == beaconId);
    emit(FavoritesState(beacons: beacons));
    return beacon;
  }
}
