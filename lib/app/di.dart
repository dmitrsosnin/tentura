import 'package:tentura/data/gql/gql_client.dart';
import 'package:tentura/data/repository/keychain_repository.dart';
import 'package:tentura/data/repository/geolocation_repository.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/auth/data/auth_repository.dart';
import 'package:tentura/features/image/data/image_repository.dart';

class DI {
  static bool _isInited = false;

  const DI();

  Future<bool> init() async {
    if (_isInited) return _isInited;

    GetIt.I.registerSingleton(GeolocationRepository());

    GetIt.I.registerSingleton(KeychainRepository());

    GetIt.I.registerSingleton(
      AuthRepository(),
      dispose: (i) => i.close(),
    );

    GetIt.I.registerSingleton(
      ImageRepository(link: GetIt.I<AuthRepository>().link),
    );

    GetIt.I.registerSingleton(
      await buildGqlClient(link: GetIt.I<AuthRepository>().link),
      dispose: (i) => i.dispose(),
    );

    await StateBase.init();

    return _isInited = true;
  }

  Future<void> close() async {
    await StateBase.close();
  }
}
