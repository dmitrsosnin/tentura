import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/data/repository/geo_repository.dart';
import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/data/service/hydrated_bloc_storage.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/beacon/data/beacon_repository.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';
import 'package:tentura/features/profile/data/profile_repository.dart';
import 'package:tentura/features/my_field/ui/bloc/my_field_cubit.dart';
import 'package:tentura/features/my_field/data/my_field_repository.dart';
import 'package:tentura/features/favorites/ui/bloc/favorites_cubit.dart';
import 'package:tentura/features/favorites/data/favorites_repository.dart';

import 'app.dart';

class DI extends StatefulWidget {
  const DI({super.key});

  @override
  State<DI> createState() => _DIState();
}

class _DIState extends State<DI> {
  late final RemoteApiService _remoteApiService;

  bool _isInitiating = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _remoteApiService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _isInitiating
      ? Container()
      : MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => GeoRepository(),
            ),
            RepositoryProvider.value(
              value: _remoteApiService,
            ),
          ],
          child: BlocProvider(
            create: (context) => AuthCubit(_remoteApiService),
            child: BlocSelector<AuthCubit, AuthState, String>(
              selector: (state) => state.currentAccount,
              builder: (context, userId) => MultiBlocProvider(
                key: ValueKey(userId),
                providers: [
                  BlocProvider(
                    create: (context) => ProfileCubit(
                      ProfileRepository(_remoteApiService),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => FavoritesCubit(
                      FavoritesRepository(_remoteApiService),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => BeaconCubit(
                      BeaconRepository(_remoteApiService),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => MyFieldCubit(
                      MyFieldRepository(_remoteApiService),
                    ),
                  ),
                ],
                child: const App(),
              ),
            ),
          ),
        );

  Future<void> _init() async {
    final storageDirectory = await getApplicationDocumentsDirectory();
    _remoteApiService = RemoteApiService(
      storagePath: storageDirectory.path,
      jwtExpiresIn: jwtExpiresIn,
      serverName: appLinkBase,
    );
    await Future.wait([
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),
      HydratedBlocStorage.init(storageDirectory),
      _remoteApiService.init(),
    ]);
    FlutterNativeSplash.remove();
    setState(() => _isInitiating = false);
  }
}
