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
import 'package:tentura/features/favorites/ui/bloc/favorites_cubit.dart';
import 'package:tentura/features/favorites/data/favorites_repository.dart';

import 'app.dart';

class DI extends StatelessWidget {
  const DI({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _init(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  snapshot.error.toString(),
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          final remoteApiService = snapshot.data;
          return remoteApiService == null
              ? Center(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      'Loading...',
                      style: Theme.of(context).primaryTextTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : MultiRepositoryProvider(
                  providers: [
                    RepositoryProvider(
                      create: (context) => GeoRepository(),
                      lazy: false,
                    ),
                    RepositoryProvider.value(value: remoteApiService),
                  ],
                  child: BlocProvider(
                    create: (context) => AuthCubit(
                      remoteApiService: remoteApiService,
                    ),
                    child: BlocSelector<AuthCubit, AuthState, String>(
                      selector: (state) => state.currentAccount,
                      builder: (context, userId) => MultiBlocProvider(
                        key: ValueKey(userId),
                        providers: [
                          BlocProvider(
                            create: (context) => ProfileCubit(
                              repository: ProfileRepository(remoteApiService),
                            ),
                          ),
                          BlocProvider(
                            create: (context) => BeaconCubit(
                              repository: BeaconRepository(remoteApiService),
                              hasTokenChanges: remoteApiService.hasTokenChanges,
                            ),
                          ),
                          BlocProvider(
                            create: (context) => FavoritesCubit(
                              repository: FavoritesRepository(remoteApiService),
                              hasTokenChanges: remoteApiService.hasTokenChanges,
                            ),
                          ),
                        ],
                        child: const App(),
                      ),
                    ),
                  ),
                );
        },
      );

  Future<RemoteApiService> _init() async {
    final storageDirectory = await getApplicationDocumentsDirectory();
    final remoteApiService = RemoteApiService(
      storagePath: storageDirectory.path,
      jwtExpiresIn: jwtExpiresIn,
      serverName: appLinkBase,
    );
    await Future.wait([
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),
      HydratedBlocStorage.init(storageDirectory),
      remoteApiService.init(),
    ]);
    FlutterNativeSplash.remove();
    return remoteApiService;
  }
}
