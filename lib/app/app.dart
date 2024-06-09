import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/theme_dark.dart';
import 'package:tentura/ui/theme_light.dart';
import 'package:tentura/ui/screens/error_screen.dart';

import 'package:tentura/features/home/home_route.dart';
import 'package:tentura/features/auth/auth_login_route.dart';
import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/profile/profile_edit_route.dart';
import 'package:tentura/features/profile_view/profile_view_route.dart';
import 'package:tentura/features/beacon_view/beacon_view_route.dart';
import 'package:tentura/features/beacon/beacon_create_route.dart';
import 'package:tentura/features/rating/rating_route.dart';
import 'package:tentura/features/graph/graph_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        color: const Color(0x00B77EFF),
        debugShowCheckedModeBanner: false,
        darkTheme: themeDark,
        theme: themeLight,
        title: 'Tentura',
        routerConfig: GoRouter(
          debugLogDiagnostics: kDebugMode,
          initialLocation: pathHomeProfile,
          navigatorKey: _rootNavigatorKey,
          observers: [
            SentryNavigatorObserver(),
          ],
          errorBuilder: (context, state) => const ErrorScreen(),
          redirect: (context, state) =>
              context.read<AuthCubit>().isAuthenticated ? null : pathAuthLogin,
          routes: [
            buildHomeRoute(parentNavigatorKey: _rootNavigatorKey),
            buildAuthLoginRoute(parentNavigatorKey: _rootNavigatorKey),
            buildProfileViewRoute(parentNavigatorKey: _rootNavigatorKey),
            buildProfileEditRoute(parentNavigatorKey: _rootNavigatorKey),
            buildBeaconCreateRoute(parentNavigatorKey: _rootNavigatorKey),
            buildBeaconViewRoute(parentNavigatorKey: _rootNavigatorKey),
            buildRatingRoute(parentNavigatorKey: _rootNavigatorKey),
            buildGraphRoute(parentNavigatorKey: _rootNavigatorKey),
          ],
        ),
      );

  static final _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
}
