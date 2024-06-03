import 'dart:async';
import 'package:collection/collection.dart';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/domain/entity/beacon.dart';

import '../../data/favorites_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

// TBD: use stream for fetch?
class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required this.id,
    required this.favoritesRepository,
  }) : super(const FavoritesState()) {
    _fetchSubscription.resume();
  }

  factory FavoritesCubit.build({
    required String id,
    required Client gqlClient,
  }) =>
      FavoritesCubit(
        id: id,
        favoritesRepository: FavoritesRepository(
          gqlClient: gqlClient,
          userId: id,
        ),
      );

  /// current UserId
  final String id;

  final FavoritesRepository favoritesRepository;

  late final _fetchSubscription = favoritesRepository.fetch().listen(
        (e) => emit(FavoritesState(
          beacons: e.toList(),
        )),
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
    favoritesRepository.refetch();
  }

  // TBD: update cache?
  Future<Beacon> pin(String beaconId) async {
    final beacon = await favoritesRepository.pin(beaconId);
    emit(FavoritesState(
      beacons: [
        ...state.beacons,
        beacon,
      ],
    ));
    return beacon;
  }

  // TBD: update cache?
  Future<Beacon> unpin(String beaconId) async {
    final beacon = favoritesRepository.unpin(beaconId);
    final beacons = [...state.beacons]..removeWhere((e) => e.id == beaconId);
    emit(FavoritesState(
      beacons: beacons,
    ));
    return beacon;
  }
}
