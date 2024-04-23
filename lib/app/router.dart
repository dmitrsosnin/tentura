import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tentura/ui/route.dart';
import 'package:tentura/ui/screens/error_screen.dart';
import 'package:tentura/features/home/home_screen.dart';
import 'package:tentura/features/auth/ui/login_screen.dart';
import 'package:tentura/features/updates/updates_screen.dart';
import 'package:tentura/features/graph/screen/graph_screen.dart';
import 'package:tentura/features/rating/screen/rating_screen.dart';
import 'package:tentura/features/my_field/screen/my_field_screen.dart';
import 'package:tentura/features/profile/screen/profile_view_screen.dart';
import 'package:tentura/features/profile/screen/profile_edit_screen.dart';
import 'package:tentura/features/beacon/screen/beacon_create_screen.dart';
import 'package:tentura/features/beacon/screen/beacon_view_screen.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

export 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: pathLogin,
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  observers: [SentryNavigatorObserver()],
  errorBuilder: (context, state) => const ErrorScreen(),
  redirect: (context, state) =>
      GetIt.I<AuthCubit>().isAuthenticated ? null : pathLogin,
  routes: [
    GoRoute(
      path: pathLogin,
      redirect: (context, state) =>
          GetIt.I<AuthCubit>().isAuthenticated ? pathHomeField : null,
      builder: (context, state) => const LogInScreen(),
      parentNavigatorKey: rootNavigatorKey,
    ),
    GoRoute(
      path: pathProfileView,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const ProfileViewScreen(),
    ),
    GoRoute(
      path: pathProfileEdit,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const ProfileEditScreen(),
    ),
    GoRoute(
      path: pathGraph,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const GraphScreen(),
    ),
    GoRoute(
      path: pathRating,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const RatingScreen(),
    ),
    GoRoute(
      path: pathBeaconCreate,
      builder: (context, state) => const BeaconCreateScreen(),
      parentNavigatorKey: rootNavigatorKey,
    ),
    GoRoute(
      path: pathBeaconView,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const BeaconViewScreen(),
    ),
    ShellRoute(
      navigatorKey: homeNavigatorKey,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(
          path: pathHomeField,
          parentNavigatorKey: homeNavigatorKey,
          builder: (context, state) => const MyFieldScreen(),
        ),
        GoRoute(
          path: pathHomeUpdates,
          parentNavigatorKey: homeNavigatorKey,
          builder: (context, state) => const UpdatesScreen(),
        ),
        GoRoute(
          path: pathHomeProfile,
          parentNavigatorKey: homeNavigatorKey,
          builder: (context, state) => const ProfileViewScreen(),
        ),
      ],
    ),
  ],
);
