import 'dart:io';
import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/types.dart';
import 'package:gravity/consts.dart';
import 'package:gravity/bloc/state_base.dart';
import 'package:gravity/bloc/bloc_data_status.dart';
import 'package:gravity/data/image_repository.dart';
import 'package:gravity/data/beacon_repository.dart';
import 'package:gravity/data/geolocation_repository.dart';

part 'beacon_create_state.dart';

class BeaconCreateCubit extends Cubit<BeaconCreateState> {
  static final _dF = DateFormat.yMd();

  final imageController = TextEditingController();
  final locationController = TextEditingController();
  final dateRangeController = TextEditingController();

  BeaconCreateCubit() : super(const BeaconCreateState()) {
    if (_geolocationRepository.myCoords == null) {
      _geolocationRepository.getMyCoords();
    }
  }

  final _imageRepository = GetIt.I<ImageRepository>();
  final _beaconRepository = GetIt.I<BeaconRepository>();
  final _geolocationRepository = GetIt.I<GeolocationRepository>();

  String _title = '';
  String _description = '';

  LatLng? get myCoords => _geolocationRepository.myCoords;

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
    final newImage = await _imageRepository.pickImage();
    if (newImage == null) return;
    imageController.text = newImage.name;
    emit(state.copyWith(imagePath: newImage.path));
  }

  void clearImage() {
    imageController.text = '';
    emit(state.copyWith(imagePath: ''));
  }

  Future<void> setCoords(LatLng? coords) async {
    if (coords == null) return;
    locationController.text = coords.toString();
    emit(state.copyWith(
      coordinates: coords,
    ));
    final place = await _geolocationRepository.getPlaceNameByCoords(coords);
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
        await _imageRepository
            .putBeacon(
              userId: beacon.author.id,
              beaconId: beacon.id,
              image: await File(state.imagePath).readAsBytes(),
            )
            .firstWhere((e) => e.isFinished);
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
