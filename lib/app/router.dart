import 'package:get_it/get_it.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:gravity/data/auth_repository.dart';

import 'package:gravity/ui/screens/error_screen.dart';
import 'package:gravity/features/home/home_screen.dart';
import 'package:gravity/features/auth/login_screen.dart';
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

const pathProfileEdit = '/profile/edit';
const pathProfileView = '/profile/view';
const pathBeaconCreate = '/beacon/create';
const pathBeaconDetails = '/beacon/details';

const pathErrorUnknown = '/error_unknown';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  redirect: (BuildContext context, GoRouterState state) =>
      GetIt.I<AuthRepository>().isAuthenticated ? null : pathLogin,
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
    GoRoute(
      path: pathProfileEdit,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: pathBeaconCreate,
      builder: (context, state) => const BeaconCreateScreen(),
      parentNavigatorKey: rootNavigatorKey,
    ),
    GoRoute(
      path: pathBeaconDetails,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const BeaconDetailsScreen(),
    ),
    ShellRoute(
      navigatorKey: homeNavigatorKey,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, child) => HomeScreen(
        path: state.path,
        child: child,
      ),
      routes: [
        GoRoute(
          path: pathField,
          parentNavigatorKey: homeNavigatorKey,
          builder: (context, state) => const MyFieldScreen(),
        ),
        GoRoute(
          path: pathBeacons,
          parentNavigatorKey: homeNavigatorKey,
          builder: (context, state) => const MyBeaconsScreen(),
        ),
        GoRoute(
          path: pathConnect,
          parentNavigatorKey: homeNavigatorKey,
          builder: (context, state) => const ConnectScreen(),
        ),
        GoRoute(
          path: pathUpdates,
          parentNavigatorKey: homeNavigatorKey,
          builder: (context, state) => const UpdatesScreen(),
        ),
        GoRoute(
          path: pathProfile,
          parentNavigatorKey: homeNavigatorKey,
          builder: (context, state) => const MyProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: pathErrorUnknown,
      builder: (context, state) => ErrorScreen(error: state.extra),
    ),
  ],
  errorBuilder: (context, state) {
    if (kDebugMode) print(state.error);
    return const ErrorScreen();
  },
);
