import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/theme_dark.dart';
import 'package:tentura/ui/theme_light.dart';
import 'package:tentura/ui/screens/error_screen.dart';
import 'package:tentura/ui/widget/platform_route_push_observer.dart';

import 'package:tentura/features/home/home_route.dart';
import 'package:tentura/features/intro/intro_route.dart';
import 'package:tentura/features/auth/auth_login_route.dart';
import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/profile/profile_edit_route.dart';
import 'package:tentura/features/profile_view/profile_view_route.dart';
import 'package:tentura/features/settings/ui/bloc/settings_cubit.dart';
import 'package:tentura/features/beacon_view/beacon_view_route.dart';
import 'package:tentura/features/beacon/beacon_create_route.dart';
import 'package:tentura/features/app_link/app_link_route.dart';
import 'package:tentura/features/rating/rating_route.dart';
import 'package:tentura/features/graph/graph_route.dart';

class App extends StatelessWidget {
  App({super.key});

  final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        final router = GoRouter(
          debugLogDiagnostics: kDebugMode,
          initialLocation: state.introEnabled ? pathIntro : pathHomeProfile,
          navigatorKey: _rootNavigatorKey,
          observers: [
            SentryNavigatorObserver(),
          ],
          errorBuilder: (context, state) => ErrorScreen(error: state.error),
          redirect: (context, state) => authCubit.state.isAuthenticated ||
                  anonymousPath.contains(state.matchedLocation)
              ? null
              : pathAuthLogin,
          routes: [
            buildHomeRoute(parentNavigatorKey: _rootNavigatorKey),
            buildIntroRoute(parentNavigatorKey: _rootNavigatorKey),
            buildAuthLoginRoute(parentNavigatorKey: _rootNavigatorKey),
            buildAppLinkViewRoute(parentNavigatorKey: _rootNavigatorKey),
            buildProfileViewRoute(parentNavigatorKey: _rootNavigatorKey),
            buildProfileEditRoute(parentNavigatorKey: _rootNavigatorKey),
            buildBeaconCreateRoute(parentNavigatorKey: _rootNavigatorKey),
            buildBeaconViewRoute(parentNavigatorKey: _rootNavigatorKey),
            buildRatingRoute(parentNavigatorKey: _rootNavigatorKey),
            buildGraphRoute(parentNavigatorKey: _rootNavigatorKey),
          ],
        );
        return MaterialApp.router(
          color: const Color(0x00B77EFF),
          title: 'Tentura',
          theme: themeLight,
          darkTheme: themeDark,
          themeMode: state.themeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          builder: (context, child) => PlatformRoutePushObserver(
            router: router,
            child: child,
          ),
        );
      },
    );
  }
}
