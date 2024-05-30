import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tentura/data/gql/gql_client.dart';
import 'package:tentura/data/repository/image_repository.dart';

import 'package:tentura/features/auth/data/auth_repository.dart';
import 'package:tentura/features/settings/data/settings_repository.dart';

class DI {
  static bool _isInited = false;

  const DI();

  Future<bool> init() async {
    if (_isInited) return _isInited;
    final appDir = await getApplicationDocumentsDirectory();
    HydratedBloc.storage = await HydratedStorage.build(
      encryptionCipher: HydratedAesCipher(
        await const SettingsRepository().getCipherKey(),
      ),
      storageDirectory: appDir,
    );

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

    return _isInited = true;
  }
}
