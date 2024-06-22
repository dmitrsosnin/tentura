import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'package:tentura/features/profile/ui/widget/profile_navbar_item.dart';

class HomeScreen extends StatelessWidget {
  static const _routes = [
    pathHomeField,
    pathHomeFavorites,
    pathHomeConnect,
    pathHomeUpdates,
    pathHomeProfile,
  ];

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
