import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'ui/screen/connect_screen.dart';

GoRoute buildConnectRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathHomeConnect,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const ConnectScreen(),
    );
