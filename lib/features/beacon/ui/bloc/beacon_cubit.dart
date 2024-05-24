import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart' show DateTimeRange;

import 'package:tentura/features/geo/domain/entity/lat_long.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/image/data/image_repository.dart';

import '../../data/beacon_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_state.dart';

class BeaconCubit extends Cubit<BeaconState> with HydratedMixin<BeaconState> {
  static const _jsonKey = 'beacons';

  BeaconCubit({
    required this.id,
    BeaconRepository? beaconRepository,
    ImageRepository? imageRepository,
  })  : _beaconRepository = beaconRepository ?? BeaconRepository(),
        _imageRepository = imageRepository ?? GetIt.I<ImageRepository>(),
        super(const BeaconState.empty()) {
    hydrate();
  }

  /// current UserId
  @override
  final String id;

  final BeaconRepository _beaconRepository;
  final ImageRepository _imageRepository;

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
    try {
      emit(BeaconState(
        beacons: (await _beaconRepository.fetchByUserId(id)).toList(),
      ));
    } catch (e) {
      emit(state.setError(e));
    }
  }

  Future<({String path, String name})?> pickImage() =>
      _imageRepository.pickImage();

  Future<void> create({
    required String title,
    String description = '',
    DateTimeRange? dateRange,
    LatLng? coordinates,
    Uint8List? image,
  }) async {
    final beacon = await _beaconRepository.create(
      title: title,
      description: description,
      dateRange: dateRange,
      coordinates: coordinates,
      hasPicture: image != null,
    );
    if (image != null && image.isNotEmpty) {
      await _imageRepository.putBeacon(
        beaconId: beacon.id,
        image: image,
        userId: id,
      );
    }
    emit(BeaconState(beacons: [beacon, ...state.beacons]));
  }

  Future<void> delete(String beaconId) async {
    await _beaconRepository.delete(beaconId);
    emit(BeaconState(
      beacons: state.beacons.where((e) => e.id != beaconId).toList(),
    ));
  }

  Future<void> toggleEnabled(String beaconId) async {
    final beacon = state.beacons.singleWhere((e) => e.id == beaconId);
    state.beacons[state.beacons.indexOf(beacon)] =
        await _beaconRepository.setEnabled(
      isEnabled: !beacon.enabled,
      id: beaconId,
    );
  }
}
