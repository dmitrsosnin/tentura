import 'dart:io';
import 'package:collection/collection.dart';

import 'package:tentura/domain/entity/date_time_range.dart';
import 'package:tentura/domain/entity/lat_long.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/image/data/image_repository.dart';

import '../../data/beacon_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_state.dart';

class BeaconCubit extends Cubit<BeaconState> with HydratedMixin<BeaconState> {
  static const _jsonKey = 'beacons';

  BeaconCubit({
    required this.id,
    BeaconRepository? repository,
  })  : _repository = repository ?? BeaconRepository(),
        super(const BeaconState.empty()) {
    hydrate();
  }

  /// current UserId
  @override
  final String id;

  final BeaconRepository _repository;

  @override
  BeaconState? fromJson(Map<String, dynamic> json) => json.containsKey(_jsonKey)
      ? BeaconState(beacons: [
          for (final b in json[_jsonKey] as List)
            Beacon.fromJson(b as Map<String, Object?>)
        ])
      : const BeaconState.empty();

  @override
  Map<String, dynamic>? toJson(BeaconState state) =>
      const ListEquality<Beacon>().equals(this.state.beacons, state.beacons)
          ? null
          : {
              _jsonKey: [for (final b in state.beacons) b.toJson()],
            };

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      emit(BeaconState(beacons: await _repository.fetchByUserId(id)));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<void> create({
    required String title,
    String description = '',
    DateTimeRange? dateRange,
    LatLng? coordinates,
    String? imagePath,
  }) async {
    try {
      final beacon = await _repository.create(
        title: title,
        description: description,
        dateRange: dateRange,
        coordinates: coordinates,
        imagePath: imagePath,
      );
      if (imagePath != null && imagePath.isNotEmpty) {
        await GetIt.I<ImageRepository>().putBeacon(
          userId: id,
          beaconId: beacon.id,
          image: await File(imagePath).readAsBytes(),
        );
      }
      state.beacons.add(beacon);
      emit(BeaconState(beacons: state.beacons));
    } catch (e) {
      emit(state.setError(e));
    }
  }
}
