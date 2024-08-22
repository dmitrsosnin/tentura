import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:tentura/domain/entity/geo.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/use_case/pick_image_case.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/beacon_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_state.dart';

class BeaconCubit extends Cubit<BeaconState> {
  BeaconCubit(
    this._repository, {
    PickImageCase pickImageCase = const PickImageCase(),
  })  : _pickImageCase = pickImageCase,
        super(const BeaconState()) {
    _fetchSubscription.resume();
  }

  final PickImageCase _pickImageCase;
  final BeaconRepository _repository;

  late final _fetchSubscription = _repository.stream.listen(
    (e) => emit(BeaconState(beacons: e.toList())),
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
    // TBD: update GQL cache
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

  Future<({String name, Uint8List bytes})?> pickImage() =>
      _pickImageCase.pickImage();
}
