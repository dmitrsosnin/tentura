import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/ui/widget/colors_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.child,
    super.key,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: kDebugMode ? const ColorsDrawer() : null,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: NavigationBar(
          selectedIndex: child.currentIndex,
          onDestinationSelected: child.goBranch,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'My field',
            ),
            NavigationDestination(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Beacons',
            ),
            NavigationDestination(
              icon: Icon(Icons.share_outlined),
              label: 'Connect',
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
