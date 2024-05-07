import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';

class FavoritesScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeFavorites,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const FavoritesScreen(),
      );

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
