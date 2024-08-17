import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tentura/app/root_router.dart';
import 'package:tentura/ui/theme_light.dart';
import 'package:tentura/ui/theme_dark.dart';

import 'package:tentura/features/settings/ui/bloc/settings_cubit.dart';

class App extends StatelessWidget {
  const App({
    required this.router,
    super.key,
  });

  final RootRouter router;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SettingsCubit, SettingsState>(
        buildWhen: (p, c) => p.themeMode != c.themeMode,
        builder: (context, state) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          color: const Color(0x003A1E5C),
          routerConfig: router.config(
            deepLinkBuilder: (deepLink) {
              if (kDebugMode) print('DeepLinkBuilder: $deepLink');
              return deepLink;
            },
            deepLinkTransformer: (Uri uri) => uri.path == pathAppLinkView
                ? SynchronousFuture(uri.replace(
                    path: switch (uri.queryParameters['id']) {
                      final String id when id.startsWith('U') =>
                        pathProfileView,
                      final String id when id.startsWith('B') => pathBeaconView,
                      final String id when id.startsWith('C') => pathBeaconView,
                      _ => pathConnect,
                    },
                  ))
                : SynchronousFuture(uri),
            navigatorObservers: () => [
              SentryNavigatorObserver(),
            ],
            reevaluateListenable: router.reevaluateListenable,
          ),
          title: 'Tentura',
          theme: themeLight,
          darkTheme: themeDark,
          themeMode: state.themeMode,
        ),
      );
}
