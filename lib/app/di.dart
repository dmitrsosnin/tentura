import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tentura/data/gql/gql_client.dart';
import 'package:tentura/data/repository/geo_repository.dart';
import 'package:tentura/data/repository/image_repository.dart';
import 'package:tentura/data/repository/settings_repository.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/auth/data/auth_repository.dart';
import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';
import 'package:tentura/features/favorites/ui/bloc/favorites_cubit.dart';

import 'app.dart';

class DI extends StatefulWidget {
  const DI({super.key});

  @override
  State<DI> createState() => _DIState();
}

class _DIState extends State<DI> {
  final _geoRepository = GeoRepository();
  final _authRepository = AuthRepository();
  final _settingsRepository = const SettingsRepository();

  late final _imageRepository = ImageRepository(
    link: _authRepository.link,
  );
  late final Client _gqlClient;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _authRepository.dispose();
    _gqlClient.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _isLoading
      ? const Center(
          child: CircularProgressIndicator.adaptive(),
        )
      : MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: _gqlClient),
            RepositoryProvider.value(value: _geoRepository),
            RepositoryProvider.value(value: _imageRepository),
            RepositoryProvider.value(value: _settingsRepository),
          ],
          child: BlocProvider(
            create: (context) => AuthCubit(
              authRepository: _authRepository,
            ),
            child: BlocSelector<AuthCubit, AuthState, String>(
              selector: (state) => state.currentAccount,
              builder: (context, currentAccount) => MultiBlocProvider(
                key: ValueKey(currentAccount),
                providers: [
                  BlocProvider(
                    create: (context) => ProfileCubit.build(
                      id: currentAccount,
                      gqlClient: _gqlClient,
                      imageRepository: _imageRepository,
                    ),
                  ),
                  BlocProvider(
                    create: (context) => BeaconCubit.build(
                      id: currentAccount,
                      gqlClient: _gqlClient,
                      imageRepository: _imageRepository,
                    ),
                  ),
                  BlocProvider(
                    create: (context) => FavoritesCubit.build(
                      id: currentAccount,
                      gqlClient: _gqlClient,
                    ),
                  ),
                ],
                child: const App(),
              ),
            ),
          ),
        );

  Future<void> _init() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    HydratedBloc.storage = await HydratedStorage.build(
      encryptionCipher: HydratedAesCipher(
        await _settingsRepository.getCipherKey(),
      ),
      storageDirectory: await getApplicationDocumentsDirectory(),
    );

    _gqlClient = await buildGqlClient(link: _authRepository.link);
    setState(() => _isLoading = false);
  }
}
