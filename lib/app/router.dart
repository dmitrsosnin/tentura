import 'package:get_it/get_it.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:gravity/data/auth_repository.dart';

import 'package:gravity/ui/screens/error_screen.dart';
import 'package:gravity/features/home/home_screen.dart';
import 'package:gravity/features/auth/login_screen.dart';
// import 'package:gravity/features/graph/graph_screen.dart';
import 'package:gravity/features/connect/connect_screen.dart';
import 'package:gravity/features/updates/updates_screen.dart';
import 'package:gravity/features/my_field/my_field_screen.dart';
import 'package:gravity/features/my_profile/my_profile_screen.dart';
import 'package:gravity/features/my_beacons/my_beacons_screen.dart';
import 'package:gravity/features/my_profile/edit_profile_screen.dart';
import 'package:gravity/features/beacon_create/beacon_create_screen.dart';
import 'package:gravity/features/beacon_details/beacon_details_screen.dart';

export 'package:go_router/go_router.dart';

const pathLogin = '/login';

// Home screen tabs
const pathField = '/field';
const pathBeacons = '/beacons';
const pathConnect = '/connect';
const pathUpdates = '/updates';
const pathProfile = '/profile';

const pathBeaconCreate = '/beacon/create';
const pathBeaconDetails = '/beacon/details';

const pathProfileEdit = '/profile/edit';

// const pathGraphView = '/graph';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: pathLogin,
  navigatorKey: rootNavigatorKey,
  observers: [SentryNavigatorObserver()],
  routes: [
    GoRoute(
      path: pathLogin,
      redirect: (context, state) =>
          GetIt.I<AuthRepository>().isAuthenticated ? pathField : null,
      builder: (context, state) => const LogInScreen(),
    ),
    // GoRoute(
    //   path: pathGraphView,
    //   redirect: _authGuardian,
    //   builder: (context, state) => const GraphScreen(),
    // ),
    GoRoute(
      path: pathProfileEdit,
      redirect: _authGuardian,
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: pathBeaconCreate,
      redirect: _authGuardian,
      builder: (context, state) => const BeaconCreateScreen(),
    ),
    GoRoute(
      path: pathBeaconDetails,
      redirect: _authGuardian,
      builder: (context, state) => const BeaconDetailsScreen(),
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
              builder: (context, state) => const MyBeaconsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: pathConnect,
              redirect: _authGuardian,
              builder: (context, state) => const ConnectScreen(),
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
    GetIt.I<AuthRepository>().isAuthenticated ? null : pathLogin;
