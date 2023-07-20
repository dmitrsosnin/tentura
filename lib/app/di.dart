import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:gravity/firebase_options.dart';
import 'package:gravity/data/api_service.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/image_repository.dart';
import 'package:gravity/data/geolocation_repository.dart';

class DI {
  static bool _isInited = false;

  const DI();

  bool get isInited => _isInited;
  bool get isNotInited => !_isInited;

  Future<DI> init() async {
    if (_isInited) return this;

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    GetIt.I.registerSingleton(await ApiService().init());
    GetIt.I.registerSingleton(await AuthRepository().init());
    GetIt.I.registerSingleton(await GeolocationRepository().init());
    GetIt.I.registerLazySingleton(ImageRepository.new);

    _isInited = true;
    return this;
  }
}
