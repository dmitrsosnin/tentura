import 'package:gravity/_shared/types.dart';
import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/beacon/data/beacon_repository.dart';

import 'new_beacon_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'new_beacon_state.dart';

class NewBeaconCubit extends Cubit<NewBeaconState> {
  NewBeaconCubit() : super(const NewBeaconState());

  final imageController = TextEditingController();
  final locationController = TextEditingController();
  final dateRangeController = TextEditingController();

  final _dateFormater = DateFormat.yMd();
  final _beaconRepository = GetIt.I<BeaconRepository>();

  void setTitle(String value) => emit(state.copyWith(title: value));

  void setDescription(String value) => emit(state.copyWith(description: value));

  void setImage(String name, String path) {
    imageController.text = name;
    emit(state.copyWith(imagePath: path));
  }

  void clearImage() {
    imageController.text = '';
    emit(state.copyWith(imagePath: ''));
  }

  void setCoords(GeoCoords? coords) {
    if (coords == null) return;
    locationController.text = coords.toString();
    emit(state.copyWith(coordinates: coords));
  }

  void clearCoords() {
    locationController.text = '';
    emit(state.copyWith(clearCoordinates: true));
  }

  void setDateRange(DateTimeRange? value) {
    if (value == null) return;
    dateRangeController.text =
        '${_dateFormater.format(value.start)} - ${_dateFormater.format(value.end)}';
    emit(state.copyWith(dateRange: value));
  }

  void clearDateRange() {
    dateRangeController.text = '';
    emit(state.copyWith(clearDateRange: true));
  }

  void save() async {
    try {
      await _beaconRepository.createBeacon(
        title: state.title,
        description: state.description,
        coordinates: state.coordinates,
        dateRange: state.dateRange,
      );
      emit(state.copyWith(status: NewBeaconStatus.done));
    } catch (e) {
      emit(state.copyWith(status: NewBeaconStatus.error, error: e));
    }
  }
}
