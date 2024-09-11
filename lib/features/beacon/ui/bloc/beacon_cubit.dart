import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:tentura/domain/entity/geo.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/use_case/pick_image_case.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/beacon_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_state.dart';

class BeaconCubit extends Cubit<BeaconState> with PickImageCase {
  BeaconCubit({
    required this.userId,
    BeaconRepository? beaconRepository,
  })  : _repository = beaconRepository ?? GetIt.I<BeaconRepository>(),
        super(const BeaconState()) {
    fetch();
  }

  final String userId;

  final BeaconRepository _repository;

  Future<void> fetch() async {
    emit(state.setLoading());
    try {
      final beacons = await _repository.fetch(userId);
      emit(BeaconState(beacons: beacons.toList()));
    } catch (e) {
      emit(state.setError(e.toString()));
    }
  }

  Future<void> create({
    required String title,
    String description = '',
    DateTimeRange? dateRange,
    Coordinates? coordinates,
    Uint8List? image,
    String? context,
  }) async {
    final beacon = await _repository.create(Beacon.empty.copyWith(
      title: title,
      context: context,
      dateRange: dateRange,
      coordinates: coordinates,
      description: description,
      hasPicture: image != null,
    ));
    if (image != null && image.isNotEmpty) {
      await _repository.putBeaconImage(
        beaconId: beacon.id,
        image: image,
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
    await _repository.delete(beaconId);
    emit(BeaconState(
      beacons: state.beacons.where((e) => e.id != beaconId).toList(),
    ));
  }

  Future<void> toggleEnabled(String beaconId) async {
    final beacon = state.beacons.singleWhere((e) => e.id == beaconId);
    state.beacons[state.beacons.indexOf(beacon)] = await _repository.setEnabled(
      isEnabled: !beacon.enabled,
      id: beaconId,
    );
  }

  Future<int> vote({
    required int amount,
    required String beaconId,
  }) async {
    final beacon = await _repository.vote(
      id: beaconId,
      amount: amount,
    );
    return beacon.my_vote ?? 0;
  }
}
