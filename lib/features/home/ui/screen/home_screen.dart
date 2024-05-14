import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';

import 'package:tentura/features/connect/ui/connect_screen.dart';
import 'package:tentura/features/updates/ui/screen/updates_screen.dart';
import 'package:tentura/features/my_field/ui/screen/my_field_screen.dart';
import 'package:tentura/features/favorites/ui/screen/favorites_screen.dart';
import 'package:tentura/features/profile/ui/screen/profile_mine_screen.dart';
import 'package:tentura/features/profile/ui/widget/profile_navbar_item.dart';

class HomeScreen extends StatelessWidget {
  static const _routes = [
    pathHomeField,
    pathHomeFavorites,
    pathHomeConnect,
    pathHomeUpdates,
    pathHomeProfile,
  ];

  static StatefulShellRoute getRoute({
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) =>
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state, child) => HomeScreen(child: child),
        branches: [
          StatefulShellBranch(
            routes: [
              MyFieldScreen.getRoute(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              FavoritesScreen.getRoute(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              ConnectScreen.getRoute(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              UpdatesScreen.getRoute(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              ProfileMineScreen.getRoute(),
            ],
          ),
        ],
      );

  const HomeScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: NavigationBar(
          selectedIndex: _routes.indexOf(GoRouterState.of(context).uri.path),
          onDestinationSelected: (i) => context.go(_routes[i]),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'My field',
            ),
            NavigationDestination(
              icon: Icon(Icons.star_border),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.cable),
              label: 'Connect',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Updates',
              enabled: false,
            ),
            NavigationDestination(
              icon: ProfileNavBarItem(),
              label: 'Profile',
            ),
          ],
        ),
        body: child,
      );
}
