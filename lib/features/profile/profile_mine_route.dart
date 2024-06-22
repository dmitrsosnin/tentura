import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'ui/screen/profile_mine_screen.dart';

GoRoute buildProfileMineRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathHomeProfile,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const ProfileMineScreen(),
    );
