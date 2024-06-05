import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'ui/screen/favorites_screen.dart';

GoRoute buildFavoritesRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathHomeFavorites,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const FavoritesScreen(),
    );
