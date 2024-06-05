import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  const DI({
    required this.storageDirectory,
    super.key,
  });

  final Directory storageDirectory;

  Future<DI> init() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await HydratedBlocStorage.init(storageDirectory);
    return this;
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: RemoteApiService(
          serverName: appLinkBase,
          jwtExpiresIn: jwtExpiresIn,
        ).init(),
        builder: (context, snapshot) => snapshot.hasError
            // Show error
            ? Center(
                child: Text(snapshot.error.toString()),
              )

            // Start App
            : snapshot.hasData
                ? MultiRepositoryProvider(
                    providers: [
                      RepositoryProvider(
                        create: (context) => GeoRepository(),
                        lazy: false,
                      ),
                      RepositoryProvider.value(value: snapshot.data!),
                    ],
                    child: BlocProvider(
                      create: (context) => AuthCubit(
                        remoteApiService: snapshot.data!,
                      ),
                      child: BlocSelector<AuthCubit, AuthState, String>(
                        selector: (state) => state.currentAccount,
                        builder: (context, userId) => MultiBlocProvider(
                          key: ValueKey(userId),
                          providers: [
                            BlocProvider(
                              create: (context) => ProfileCubit(
                                id: userId,
                                profileRepository: ProfileRepository(
                                  remoteApiService: snapshot.data!,
                                ),
                              ),
                            ),
                            BlocProvider(
                              create: (context) => BeaconCubit(
                                beaconRepository: BeaconRepository(
                                  remoteApiService: snapshot.data!,
                                  userId: userId,
                                ),
                              ),
                            ),
                            BlocProvider(
                              create: (context) => FavoritesCubit(
                                favoritesRepository: FavoritesRepository(
                                  remoteApiService: snapshot.data!,
                                  userId: userId,
                                ),
                              ),
                            ),
                          ],
                          child: const App(),
                        ),
                      ),
                    ),
                  )

                // Show loader
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
      );
}
