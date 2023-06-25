import 'package:get_it/get_it.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'package:gravity/_shared/consts.dart';
import 'package:gravity/auth/data/auth_repository.dart';

import 'package:gravity/home/ui/home_screen.dart';
import 'package:gravity/auth/ui/login_screen.dart';
import 'package:gravity/field/ui/field_screen.dart';
import 'package:gravity/user/ui/my_profile_screen.dart';
import 'package:gravity/beacon/ui/beacon_screen.dart';
import 'package:gravity/updates/ui/updates_screen.dart';
import 'package:gravity/_shared/ui/screen/error_screen.dart';

export 'package:go_router/go_router.dart';

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
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: pathField,
              redirect: _authGuardian,
              builder: (context, state) => const FieldScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: pathBeacons,
              redirect: _authGuardian,
              builder: (context, state) => const BeaconScreen(),
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
