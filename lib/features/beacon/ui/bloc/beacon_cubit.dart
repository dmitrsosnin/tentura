import 'dart:typed_data';
import 'package:flutter/material.dart' show DateTimeRange;

import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/geo.dart';
import 'package:tentura/domain/use_case/pick_image_case.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/beacon_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_state.dart';

class BeaconCubit extends Cubit<BeaconState> {
  BeaconCubit({
    required this.beaconRepository,
    this.pickImageCase = const PickImageCase(),
  }) : super(const BeaconState(status: FetchStatus.isLoading)) {
    _fetchSubscription.resume();
  }

  final PickImageCase pickImageCase;
  final BeaconRepository beaconRepository;

  late final _fetchSubscription = beaconRepository.stream.listen(
    (e) => emit(BeaconState(beacons: e.toList())),
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
    beaconRepository.refetch();
  }

  Future<void> create({
    required String title,
    String description = '',
    DateTimeRange? dateRange,
    Coordinates? coordinates,
    Uint8List? image,
  }) async {
    final beacon = await beaconRepository.create(
      title: title,
      description: description,
      dateRange: dateRange,
      coordinates: coordinates,
      hasPicture: image != null,
    );
    if (image != null && image.isNotEmpty) {
      await beaconRepository.remoteApiService.putBeacon(
        image,
        beaconId: beacon.id,
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
    await beaconRepository.delete(beaconId);
    emit(BeaconState(
      beacons: state.beacons.where((e) => e.id != beaconId).toList(),
    ));
  }

  Future<void> toggleEnabled(String beaconId) async {
    final beacon = state.beacons.singleWhere((e) => e.id == beaconId);
    state.beacons[state.beacons.indexOf(beacon)] =
        await beaconRepository.setEnabled(
      isEnabled: !beacon.enabled,
      id: beaconId,
    );
  }

  Future<({String path, String name})?> pickImage() =>
      pickImageCase.pickImage();
}
