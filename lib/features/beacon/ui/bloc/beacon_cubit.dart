import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart' show DateTimeRange;

import 'package:tentura/data/repository/image_repository.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/geo.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/beacon_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_state.dart';

// TBD: use Hive directly
class BeaconCubit extends Cubit<BeaconState> with HydratedMixin<BeaconState> {
  static const _jsonKey = 'beacons';

  BeaconCubit({
    required this.id,
    required ImageRepository imageRepository,
    required BeaconRepository beaconRepository,
  })  : _beaconRepository = beaconRepository,
        _imageRepository = imageRepository,
        super(const BeaconState.empty()) {
    hydrate();
  }

  factory BeaconCubit.build({
    required String id,
    required Client gqlClient,
    required ImageRepository imageRepository,
  }) =>
      BeaconCubit(
        id: id,
        imageRepository: imageRepository,
        beaconRepository: BeaconRepository(gqlClient: gqlClient),
      );

  /// current UserId
  @override
  final String id;

  final BeaconRepository _beaconRepository;
  final ImageRepository _imageRepository;

  @override
  BeaconState? fromJson(Map<String, Object?> json) => json.containsKey(_jsonKey)
      ? BeaconState(beacons: [
          for (final b in json[_jsonKey] as List? ?? [])
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

  Future<void> create({
    required String title,
    String description = '',
    DateTimeRange? dateRange,
    Coordinates? coordinates,
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
    emit(BeaconState(
      beacons: [
        beacon,
        ...state.beacons,
      ],
    ));
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

  Future<({String path, String name})?> pickImage() =>
      _imageRepository.pickImage();
}
