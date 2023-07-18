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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: child.currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: child.goBranch,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'My field',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Beacons',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share_outlined),
              label: 'Connect',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Updates',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
        body: child,
        drawer: kDebugMode ? const ColorsDrawer() : null,
        resizeToAvoidBottomInset: false,
      );
}
