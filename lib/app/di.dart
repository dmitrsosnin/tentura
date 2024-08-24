import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:share_handler/share_handler.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/app/root_router.dart';
import 'package:tentura/data/repository/geo_repository.dart';
import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/data/service/hydrated_bloc_storage.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/beacon/data/beacon_repository.dart';
import 'package:tentura/features/context/data/context_repository.dart';
import 'package:tentura/features/context/ui/bloc/context_cubit.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';
import 'package:tentura/features/profile/data/profile_repository.dart';
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

  bool _isInitiating = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
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
            RepositoryProvider.value(value: _remoteApiService),
            RepositoryProvider(create: (_) => GeoRepository()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => SettingsCubit()),
              BlocProvider(create: (_) => AuthCubit(_remoteApiService)),
            ],
            child: BlocSelector<AuthCubit, AuthState, String>(
              selector: (state) => state.currentAccount,
              builder: (context, userId) => MultiBlocProvider(
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
    final packageInfo = await PackageInfo.fromPlatform();
    _remoteApiService = RemoteApiService(
      userAgent: 'Tentura (${packageInfo.version})',
      storagePath:
          kIsWeb ? '' : (await getApplicationDocumentsDirectory()).path,
      jwtExpiresIn: jwtExpiresIn,
      serverName: appLinkBase,
    );
    await Future.wait([
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),
      HydratedBlocStorage.init(),
      _remoteApiService.init(),
    ]);
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
