import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/ui/theme_light.dart';
import 'package:tentura/ui/theme_dark.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/ui/bloc/beacon_cubit.dart';
import 'package:tentura/features/context/ui/bloc/context_cubit.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';
import 'package:tentura/features/my_field/ui/bloc/my_field_cubit.dart';
import 'package:tentura/features/settings/ui/bloc/settings_cubit.dart';
import 'package:tentura/features/favorites/ui/bloc/favorites_cubit.dart';

import 'di/di.dart';

class App extends StatelessWidget {
  static Future<void> appRunner() async {
    FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await configureDependencies();
    FlutterNativeSplash.remove();
    runApp(const App());
  }

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;
    final router = getIt<RootRouter>();
    return BlocSelector<SettingsCubit, SettingsState, ThemeMode>(
      bloc: getIt<SettingsCubit>(),
      selector: (state) => state.themeMode,
      builder: (context, themeMode) => MaterialApp.router(
        title: appTitle,
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: themeMode,
        color: const Color(0xFF3A1E5C),
        debugShowCheckedModeBanner: false,
        routerConfig: router.config(
          deepLinkBuilder: kDebugMode ? router.deepLinkBuilder : null,
          deepLinkTransformer: router.deepLinkTransformer,
          navigatorObservers: () => [
            getIt<SentryNavigatorObserver>(),
          ],
          reevaluateListenable: router.reevaluateListenable,
        ),
        builder: (context, child) => BlocSelector<AuthCubit, AuthState, String>(
          bloc: getIt<AuthCubit>(),
          selector: (state) => state.currentAccountId,
          builder: (context, accountId) => MultiBlocProvider(
            key: ValueKey(accountId),
            providers: [
              BlocProvider(create: (_) => ContextCubit()),
              BlocProvider(create: (_) => MyFieldCubit()),
              BlocProvider(create: (_) => FavoritesCubit()),
              BlocProvider(create: (_) => BeaconCubit(userId: accountId)),
              BlocProvider(
                create: (_) => ProfileCubit(id: accountId, fromCache: false),
              ),
            ],
            child: child ?? Container(),
          ),
        ),
      ),
    );
  }
}
