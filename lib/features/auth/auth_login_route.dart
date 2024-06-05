import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'ui/screen/auth_login_screen.dart';

GoRoute buildAuthLoginRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathAuthLogin,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const AuthLoginScreen(),
    );
