import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:gravity/firebase_options.dart';
import 'package:gravity/data/api_service.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/user_repository.dart';
import 'package:gravity/data/image_repository.dart';
import 'package:gravity/data/beacon_repository.dart';
import 'package:gravity/data/geolocation_repository.dart';

import 'package:gravity/features/my_beacons/my_beacons_cubit.dart';
import 'package:gravity/features/my_field/bloc/my_field_cubit.dart';
import 'package:gravity/features/my_profile/bloc/my_profile_cubit.dart';

class DI {
  static bool _isInited = false;

  const DI();

  bool get isInited => _isInited;
  bool get isNotInited => !_isInited;

  Future<DI> init() async {
    if (_isInited) return this;

    EquatableConfig.stringify = true;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Data providers
    GetIt.I.registerSingleton(await ApiService().init());
    GetIt.I.registerSingleton(await AuthRepository().init());
    GetIt.I.registerSingleton(await GeolocationRepository().init());
    GetIt.I.registerLazySingleton(UserRepository.new);
    GetIt.I.registerLazySingleton(ImageRepository.new);
    GetIt.I.registerLazySingleton(BeaconRepository.new);

    // BLoC (persisted)
    GetIt.I.registerLazySingleton(MyBeaconsCubit.new);
    GetIt.I.registerLazySingleton(MyFieldCubit.new);
    GetIt.I.registerLazySingleton(MyProfileCubit.new);

    _isInited = true;
    return this;
  }
}
