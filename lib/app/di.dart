import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:share_handler/share_handler.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/app/root_router.dart';
import 'package:tentura/data/repository/geo_repository.dart';
import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/data/service/local_secure_storage.dart';

import 'package:tentura/features/auth/data/repository/auth_repository.dart';
import 'package:tentura/features/auth/domain/use_case/auth_case.dart';
import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/beacon/data/beacon_repository.dart';

import 'package:tentura/features/context/data/context_repository.dart';
import 'package:tentura/features/context/ui/bloc/context_cubit.dart';
import 'package:tentura/features/profile/data/repository/profile_local_repository.dart';

import 'package:tentura/features/profile/data/repository/profile_remote_repository.dart';
import 'package:tentura/features/profile/domain/use_case/profile_case.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';

import 'package:tentura/features/settings/data/settings_repository.dart';
import 'package:tentura/features/settings/ui/bloc/settings_cubit.dart';

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
  final _router = RootRouter();

  final _localSecureStorage = LocalSecureStorage();

  // final _subscription = ShareHandlerPlatform.instance.sharedMediaStream.listen(
  //   (e) {
  //     if (kDebugMode) {
  //       print('Stream: ${e.content}');
  //       // ignore: avoid_print
  //       e.attachments?.forEach(print);
  //     }
  //   },
  // );

  late final RemoteApiService _remoteApiService;

  late final SettingsCubit _settingsCubit;

  late final AuthCubit _authCubit;

  bool _isInitiating = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _authCubit.close();
    _settingsCubit.close();
    _remoteApiService.dispose();
    // _subscription.cancel();
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _isInitiating
      ? Container()
      : MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (_) => GeoRepository()),
            RepositoryProvider.value(value: _remoteApiService),
            RepositoryProvider.value(value: _localSecureStorage),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _authCubit),
              BlocProvider.value(value: _settingsCubit),
            ],
            child: BlocSelector<AuthCubit, AuthState, String>(
              selector: (state) => state.currentAccountId,
              builder: (context, accountId) => MultiBlocProvider(
                key: ValueKey(accountId),
                providers: [
                  BlocProvider(
                    create: (context) => ProfileCubit(
                      ProfileCase(
                        profileLocalRepository:
                            ProfileLocalRepository(_localSecureStorage),
                        profileRemoteRepository:
                            ProfileRemoteRepository(_remoteApiService),
                      ),
                      id: accountId,
                      fromCache: false,
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
                  BlocProvider(
                    create: (context) => ContextCubit(
                      ContextRepository(_remoteApiService),
                    ),
                  ),
                ],
                child: App(
                  router: _router
                    ..authCubit = context.read<AuthCubit>()
                    ..settingsCubit = context.read<SettingsCubit>(),
                ),
              ),
            ),
          ),
        );

  Future<void> _init() async {
    _remoteApiService = RemoteApiService(
      jwtExpiresIn: jwtExpiresIn,
      serverName: appLinkBase,
      userAgent: 'Tentura',
    );
    await Future.wait([
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),
      _remoteApiService.init(),
    ]);
    _settingsCubit = await SettingsCubit.hydrated(
      SettingsRepository(_localSecureStorage),
    );
    _authCubit = await AuthCubit.hydrated(AuthCase(
      authRepository: AuthRepository(_localSecureStorage),
      remoteApiService: _remoteApiService,
    ));
    //
    // await ShareHandlerPlatform.instance.getInitialSharedMedia().then(
    //   (e) {
    //     if (e != null) {
    //       if (kDebugMode) {
    //         print('Initial Future: ${e.content}');
    //         // ignore: avoid_print
    //         e.attachments?.forEach(print);
    //       }
    //     }
    //   },
    // );
    //
    FlutterNativeSplash.remove();
    setState(() => _isInitiating = false);
  }
}
