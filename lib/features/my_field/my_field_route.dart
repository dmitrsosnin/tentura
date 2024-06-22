import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'ui/screen/my_field_screen.dart';

GoRoute buildMyFieldRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathHomeField,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const MyFieldScreen(),
    );
