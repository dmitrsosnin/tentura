import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/_shared/types.dart';
import 'package:gravity/_shared/consts.dart';
import 'package:gravity/_shared/bloc/state_base.dart';
import 'package:gravity/_shared/bloc/bloc_data_status.dart';

import 'package:gravity/beacon/data/beacon_repository.dart';
import 'package:gravity/beacon/use_case/beacon_image_case.dart';
import 'package:gravity/_shared/data/geocoding_repository.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'new_beacon_state.dart';

class NewBeaconCubit extends Cubit<NewBeaconState> with BeaconImageCase {
  static final _dF = DateFormat.yMd();

  final imageController = TextEditingController();
  final locationController = TextEditingController();
  final dateRangeController = TextEditingController();

  NewBeaconCubit() : super(const NewBeaconState()) {
    if (_geocodingRepository.myCoords == null) {
      _geocodingRepository.getMyCoords();
    }
  }

  final _beaconRepository = GetIt.I<BeaconRepository>();
  final _geocodingRepository = GetIt.I<GeocodingRepository>();

  String _title = '';
  String _description = '';

  LatLng? get myCoords => _geocodingRepository.myCoords;

  void setTitle(String value) {
    _title = value;
    if (_title.length < titleMinLength && state.isValid) {
      emit(state.copyWith(isValid: false));
    } else if (_title.length >= titleMinLength && state.isNotValid) {
      emit(state.copyWith(isValid: true));
    }
  }

  void setDescription(String value) {
    _description = value;
  }

  Future<void> setImage() async {
    final newImage = await pickImage();
    if (newImage == null) return;
    imageController.text = newImage.name;
    emit(state.copyWith(imagePath: newImage.path));
  }

  void clearImage() {
    imageController.text = '';
    emit(state.copyWith(imagePath: ''));
  }

  Future<void> setCoords(LatLng coords) async {
    locationController.text = coords.toString();
    emit(state.copyWith(
      coordinates: coords,
    ));
    final place = await _geocodingRepository.getPlaceNameByCoords(coords);
    if (place != null) {
      locationController.text =
          '${place.locality ?? "Unknown"}, ${place.country ?? "Unknown"}';
    }
  }

  void clearCoords() {
    locationController.text = '';
    emit(state.copyWith(
      clearCoordinates: true,
    ));
  }

  void setDateRange(DateTimeRange? value) {
    if (value == null) return;
    dateRangeController.text =
        '${_dF.format(value.start)} - ${_dF.format(value.end)}';
    emit(state.copyWith(
      dateRange: value,
    ));
  }

  void clearDateRange() {
    dateRangeController.text = '';
    emit(state.copyWith(
      clearDateRange: true,
    ));
  }

  Future<void> save() async {
    try {
      final beacon = await _beaconRepository.createBeacon(
        title: _title,
        description: _description,
        dateRange: state.dateRange,
        coordinates: state.coordinates,
        hasPicture: state.imagePath.isNotEmpty,
      );
      if (state.imagePath.isNotEmpty) {
        await setBeaconImageOf(beacon, state.imagePath);
      }
      emit(state.copyWith(
        status: BlocDataStatus.hasData,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocDataStatus.hasError,
        error: e,
      ));
    }
  }
}
