import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tentura/data/repository/image_repository.dart';
import 'package:tentura/data/repository/settings_repository.dart';

import 'package:tentura/features/geo/ui/cubit/geo_cubit.dart';
import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/auth/data/auth_repository.dart';
import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/beacon/data/beacon_repository.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';
import 'package:tentura/features/profile/data/profile_repository.dart';
import 'package:tentura/features/favorites/ui/bloc/favorites_cubit.dart';
import 'package:tentura/features/favorites/data/favorites_repository.dart';

import 'app.dart';

class DI extends StatefulWidget {
  const DI({super.key});

  @override
  State<DI> createState() => _DIState();
}

class _DIState extends State<DI> {
  final _authRepository = AuthRepository();
  final _settingsRepository = const SettingsRepository();

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
            RepositoryProvider(
              create: (context) => ImageRepository(
                link: _authRepository.link,
              ),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GeoCubit(),
              ),
              BlocProvider(
                create: (context) => AuthCubit(
                  authRepository: _authRepository,
                ),
              ),
            ],
            child: BlocSelector<AuthCubit, AuthState, String>(
              selector: (state) => state.currentAccount,
              builder: (context, currentAccount) => MultiBlocProvider(
                key: ValueKey(currentAccount),
                providers: [
                  BlocProvider(
                    create: (context) => ProfileCubit(
                      id: currentAccount,
                      imageRepository: context.read<ImageRepository>(),
                      profileRepository: ProfileRepository(
                        gqlClient: _gqlClient,
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => BeaconCubit(
                      id: currentAccount,
                      imageRepository: context.read<ImageRepository>(),
                      beaconRepository: BeaconRepository(gqlClient: _gqlClient),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => FavoritesCubit(
                      id: currentAccount,
                      favoritesRepository: FavoritesRepository(
                        gqlClient: _gqlClient,
                      ),
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
