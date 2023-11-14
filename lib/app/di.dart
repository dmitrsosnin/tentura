import 'package:get_it/get_it.dart';
import 'package:preferences_repository/preferences_repository.dart';

import 'package:gravity/consts.dart';
import 'package:gravity/data/gql/client.dart';
import 'package:gravity/data/image_repository.dart';
import 'package:gravity/data/geolocation_repository.dart';
import 'package:gravity/data/auth_repository.dart';

class DI {
  static bool _isInited = false;

  const DI();

  bool get isInited => _isInited;
  bool get isNotInited => !_isInited;

  Future<DI> init() async {
    if (_isInited) return this;
    GetIt.I.registerSingleton(
      await PreferencesRepository().init(),
    );
    GetIt.I.registerSingleton(
      await GeolocationRepository().init(),
    );

    final authRepository = await AuthRepository().init();
    GetIt.I.registerSingleton(
      authRepository,
      dispose: (i) async => i.dispose(),
    );

    GetIt.I.registerSingleton(await getGQLClient(authRepository.freshLink));
    GetIt.I.registerSingleton(ImageRepository(appLinkBase: appLinkBase));

    _isInited = true;
    return this;
  }
}
