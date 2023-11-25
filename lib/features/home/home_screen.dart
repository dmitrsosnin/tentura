import 'package:flutter/material.dart';

import 'package:tentura/app/router.dart';

class HomeScreen extends StatelessWidget {
  static const _routes = [
    pathHomeField,
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
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Updates',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
        body: child,
      );
}
