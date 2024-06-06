import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';

import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/favorites_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required FavoritesRepository repository,
  })  : _repository = repository,
        super(const FavoritesState(status: FetchStatus.isLoading)) {
    _fetchSubscription.resume();
  }

  FavoritesCubit.build(BuildContext context)
      : this(
          repository: FavoritesRepository(context.read<RemoteApiService>()),
        );

  final FavoritesRepository _repository;

  late final _fetchSubscription = _repository.stream.listen(
    (e) => emit(FavoritesState(beacons: e.toList())),
    onError: (dynamic e) => emit(state.setError(e.toString())),
    cancelOnError: false,
  );

  @override
  Future<void> close() async {
    await _fetchSubscription.cancel();
    return super.close();
  }

  Future<void> fetch() async {
    emit(state.setLoading());
    _repository.refetch();
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
