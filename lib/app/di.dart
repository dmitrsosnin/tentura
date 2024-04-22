import 'package:tentura/data/geolocation_repository.dart';
import 'package:tentura/data/service/hydrated_db_service.dart';
import 'package:tentura/data/repository/image_repository.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

class DI {
  static bool _isInited = false;

  const DI();

  Future<bool> init() async {
    if (_isInited) return _isInited;

    await HydratedDbService.init();

    GetIt.I.registerSingleton(ImageRepository());

    GetIt.I.registerSingleton(await GeolocationRepository().init());

    GetIt.I.registerSingleton(
      await AuthCubit().init(),
      dispose: (i) async => i.close(),
    );

    return _isInited = true;
  }
}
