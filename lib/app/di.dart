import 'package:path_provider/path_provider.dart';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/data/gql/gql_client.dart';
import 'package:tentura/data/repository/keychain_repository.dart';

import 'package:tentura/features/geo/data/geo_repository.dart';
import 'package:tentura/features/auth/data/auth_repository.dart';
import 'package:tentura/features/image/data/image_repository.dart';

class DI {
  static bool _isInited = false;

  const DI();

  Future<bool> init() async {
    if (_isInited) return _isInited;

    GetIt.I.registerSingleton(GeoRepository());

    final keychainRepository = KeychainRepository();
    GetIt.I.registerSingleton(keychainRepository);

    final authRepository = AuthRepository();
    GetIt.I.registerSingleton(
      authRepository,
      dispose: (i) => i.close(),
    );

    GetIt.I.registerSingleton(
      ImageRepository(link: authRepository.link),
    );

    GetIt.I.registerSingleton(
      await buildGqlClient(link: authRepository.link),
      dispose: (i) => i.dispose(),
    );

    await StateBase.init(
      cipherKey: await keychainRepository.getCipherKey(),
      storageDirectory: await getApplicationDocumentsDirectory(),
    );

    return _isInited = true;
  }

  Future<void> close() async {
    await StateBase.close();
  }
}
