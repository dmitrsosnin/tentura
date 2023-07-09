import 'package:get_it/get_it.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'package:gravity/ui/error_screen.dart';
import 'package:gravity/data/auth_repository.dart';

import 'package:gravity/features/home/home_screen.dart';
import 'package:gravity/features/auth/login_screen.dart';
import 'package:gravity/features/beacons/beacons_screen.dart';
import 'package:gravity/features/updates/updates_screen.dart';
import 'package:gravity/features/my_field/my_field_screen.dart';
import 'package:gravity/features/my_profile/my_profile_screen.dart';

export 'package:go_router/go_router.dart';

const pathLogin = '/login';
const pathField = '/field';
const pathBeacons = '/beacons';
const pathUpdates = '/updates';
const pathProfile = '/profile';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: pathField,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: pathLogin,
      builder: (context, state) => const LogInScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => HomeScreen(child: child),
      parentNavigatorKey: rootNavigatorKey,
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: pathField,
              redirect: _authGuardian,
              builder: (context, state) => const MyFieldScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: pathBeacons,
              redirect: _authGuardian,
              builder: (context, state) => const BeaconsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: pathUpdates,
              redirect: _authGuardian,
              builder: (context, state) => const UpdatesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: pathProfile,
              redirect: _authGuardian,
              builder: (context, state) => const MyProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    if (kDebugMode) print(state.error);
    return const ErrorScreen();
  },
);

String? _authGuardian(BuildContext context, GoRouterState state) =>
    GetIt.I<AuthRepository>().myId.isEmpty ? pathLogin : null;
