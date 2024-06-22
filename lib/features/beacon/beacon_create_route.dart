import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'ui/screen/beacon_create_screen.dart';

GoRoute buildBeaconCreateRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathBeaconCreate,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const BeaconCreateScreen(),
    );
