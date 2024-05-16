import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/screens/error_screen.dart';

// import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/home/ui/screen/home_screen.dart';
import 'package:tentura/features/graph/ui/screen/graph_screen.dart';
import 'package:tentura/features/rating/ui/screen/rating_screen.dart';
import 'package:tentura/features/auth/ui/screen/auth_login_screen.dart';
import 'package:tentura/features/beacon/ui/screen/beacon_view_screen.dart';
import 'package:tentura/features/beacon/ui/screen/beacon_create_screen.dart';
import 'package:tentura/features/profile/ui/screen/profile_view_screen.dart';
import 'package:tentura/features/profile/ui/screen/profile_edit_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: pathHomeProfile,
  navigatorKey: _rootNavigatorKey,
  observers: [
    SentryNavigatorObserver(),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
  // redirect: (context, state) =>
  //     context.read<AuthCubit>().isAuthenticated ? null : pathAuthLogin,
  routes: [
    HomeScreen.getRoute(parentNavigatorKey: _rootNavigatorKey),
    AuthLoginScreen.getRoute(parentNavigatorKey: _rootNavigatorKey),
    ProfileViewScreen.getRoute(parentNavigatorKey: _rootNavigatorKey),
    ProfileEditScreen.getRoute(parentNavigatorKey: _rootNavigatorKey),
    BeaconCreateScreen.getRoute(parentNavigatorKey: _rootNavigatorKey),
    BeaconViewScreen.getRoute(parentNavigatorKey: _rootNavigatorKey),
    RatingScreen.getRoute(parentNavigatorKey: _rootNavigatorKey),
    GraphScreen.getRoute(parentNavigatorKey: _rootNavigatorKey),
  ],
);

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
