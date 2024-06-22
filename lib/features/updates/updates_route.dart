import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'ui/screen/updates_screen.dart';

GoRoute buildUpdatesRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathHomeUpdates,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const UpdatesScreen(),
    );
