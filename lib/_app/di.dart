import 'package:get_it/get_it.dart';
import 'package:equatable/equatable.dart';

import 'package:gravity/_shared/data/api_service.dart';

import 'package:gravity/auth/data/auth_repository.dart';
import 'package:gravity/user/data/user_repository.dart';
import 'package:gravity/image/data/image_repository.dart';
import 'package:gravity/beacon/data/beacon_repository.dart';

import 'package:gravity/beacon/bloc/my_beacons_cubit.dart';

class DI {
  static bool _isInited = false;

  const DI();

  bool get isInited => _isInited;
  bool get isNotInited => !_isInited;

  Future<void> init() async {
    if (_isInited) return;

    EquatableConfig.stringify = true;

    // Service
    GetIt.I.registerSingleton(await ApiService().init());

    // Repository
    GetIt.I.registerSingleton(await AuthRepository().init());
    GetIt.I.registerSingleton(UserRepository());
    GetIt.I.registerSingleton(ImageRepository());
    GetIt.I.registerSingleton(BeaconRepository());

    // BLoC
    GetIt.I.registerLazySingleton<MyBeaconsCubit>(() => MyBeaconsCubit());

    _isInited = true;
  }
}
