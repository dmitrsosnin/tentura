import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/ui/theme_light.dart';
import 'package:tentura/ui/theme_dark.dart';

import 'package:tentura/features/settings/ui/bloc/settings_cubit.dart';

class App extends StatelessWidget {
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
          deepLinkBuilder: kDebugMode
              ? (deepLink) {
                  // ignore: avoid_print
                  print('DeepLinkBuilder: ${deepLink.uri}');
                  return deepLink;
                }
              : null,
          deepLinkTransformer: (uri) =>
              SynchronousFuture(uri.path == pathAppLinkView
                  ? uri.replace(
                      path: switch (uri.queryParameters['id']) {
                        final String id when id.startsWith('U') =>
                          pathProfileView,
                        final String id when id.startsWith('B') =>
                          pathBeaconView,
                        final String id when id.startsWith('C') =>
                          pathBeaconView,
                        _ => pathConnect,
                      },
                    )
                  : uri),
          navigatorObservers: () => [
            getIt<SentryNavigatorObserver>(),
          ],
          reevaluateListenable: router.reevaluateListenable,
        ),
      ),
    );
  }
}
