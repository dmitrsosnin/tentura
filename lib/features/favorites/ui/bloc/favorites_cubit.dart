import 'dart:async';
import 'package:collection/collection.dart';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/domain/entity/beacon.dart';

import '../../data/favorites_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

// TBD: use ferry cache?
class FavoritesCubit extends Cubit<FavoritesState>
    with HydratedMixin<FavoritesState> {
  FavoritesCubit({
    required this.id,
    required this.favoritesRepository,
  }) : super(const FavoritesState()) {
    hydrate();
  }

  factory FavoritesCubit.build({
    required String id,
    required Client gqlClient,
  }) =>
      FavoritesCubit(
        id: id,
        favoritesRepository: FavoritesRepository(
          gqlClient: gqlClient,
        ),
      );

  /// current UserId
  @override
  final String id;

  final FavoritesRepository favoritesRepository;

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) => FavoritesState(
      beacons: json.values
          .map((e) => Beacon.fromJson(e as Map<String, Object?>))
          .toList());

  @override
  Map<String, dynamic>? toJson(FavoritesState state) =>
      state.isSameAs(this.state)
          ? null
          : {
              for (final b in state.beacons.indexed)
                b.$1.toString(): b.$2.toJson(),
            };

  Future<void> fetch() async {
    try {
      final beacons = await favoritesRepository.fetchPinned(id);
      emit(FavoritesState(
        beacons: beacons.toList(),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

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

  Future<Beacon> unpin(String beaconId) async {
    final beacon = favoritesRepository.unpin(
      userId: id,
      beaconId: beaconId,
    );
    final beacons = [...state.beacons]..removeWhere((e) => e.id == beaconId);
    emit(FavoritesState(
      beacons: beacons,
    ));
    return beacon;
  }
}
