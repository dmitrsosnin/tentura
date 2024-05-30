import 'dart:async';
import 'package:collection/collection.dart';

import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/domain/entity/beacon.dart';

import '../../data/favorites_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

// TBD: use Hive directly
class FavoritesCubit extends Cubit<FavoritesState>
    with HydratedMixin<FavoritesState> {
  static const _jsonKey = 'beacons';

  FavoritesCubit({
    required this.id,
    FavoritesRepository? favoritesRepository,
  })  : _favoritesRepository = favoritesRepository ?? FavoritesRepository(),
        super(const FavoritesState()) {
    hydrate();
  }

  /// current UserId
  @override
  final String id;

  final FavoritesRepository _favoritesRepository;

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) =>
      json.containsKey(_jsonKey)
          ? FavoritesState(beacons: [
              for (final b in json[_jsonKey] as List)
                Beacon.fromJson(b as Map<String, Object?>)
            ])
          : const FavoritesState.empty();

  @override
  Map<String, dynamic>? toJson(FavoritesState state) =>
      const ListEquality<Beacon>().equals(this.state.beacons, state.beacons)
          ? null
          : {
              _jsonKey: [for (final b in state.beacons) b.toJson()],
            };

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      final beacons = await _favoritesRepository.fetchPinned(id);
      emit(FavoritesState(
        // TBD: remove that ugly 'where' when able filter in request
        beacons: beacons.where((e) => e.enabled).toList(),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<Beacon> pin(String beaconId) => _favoritesRepository.pin(beaconId);

  Future<Beacon> unpin(String beaconId) => _favoritesRepository.unpin(
        userId: id,
        beaconId: beaconId,
      );
}
