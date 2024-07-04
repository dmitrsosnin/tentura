import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'ui/screen/intro_screen.dart';

GoRoute buildIntroRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathIntro,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const IntroScreen(),
    );
