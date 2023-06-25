import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/beacon/entity/beacon.dart';
import 'package:gravity/auth/data/auth_repository.dart';
import 'package:gravity/beacon/data/beacon_repository.dart';
import 'package:gravity/image/data/image_repository.dart';

import 'my_beacons_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'my_beacons_state.dart';

class MyBeaconsCubit extends Cubit<MyBeaconsState> {
  MyBeaconsCubit() : super(const MyBeaconsState()) {
    _beaconRepository.updates.listen((beacon) {
      emit(state.copyWith(beacons: [beacon, ...state.beacons]));
    });
  }

  final _authRepository = GetIt.I<AuthRepository>();
  final _imageRepository = GetIt.I<ImageRepository>();
  final _beaconRepository = GetIt.I<BeaconRepository>();

  Future<Uint8List?> getAvatarImageOf(Beacon beacon) async {
    try {
      return await _imageRepository
          .getAvatarOf(beacon.author.id)
          .timeout(const Duration(seconds: 3));
    } on PlatformException catch (_) {
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Uint8List?> getBeaconImageOf(Beacon beacon) async {
    if (beacon.hasNoPicture) return null;
    try {
      return await _imageRepository
          .getBeaconOf(beacon.author.id, beacon.id)
          .timeout(const Duration(seconds: 3));
    } on PlatformException catch (_) {
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> refresh({bool useCache = false}) async {
    emit(state.copyWith(isLoading: true));
    final beacons = await _beaconRepository.getBeaconsOf(_authRepository.myId);
    beacons.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    emit(state.copyWith(
      isLoading: false,
      beacons: beacons,
    ));
  }
}
