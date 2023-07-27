import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/ui/widget/colors_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routes = [
    pathField,
    pathBeacons,
    pathConnect,
    pathUpdates,
    pathProfile,
  ];

  final int index;
  final Widget child;

  HomeScreen({
    required this.child,
    String? path,
    super.key,
  }) : index = routes.indexOf(path ?? '');

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _tabIndex = widget.index > 0 ? widget.index : 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: kDebugMode ? const ColorsDrawer() : null,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: NavigationBar(
          selectedIndex: _tabIndex,
          onDestinationSelected: (i) {
            setState(() => _tabIndex = i);
            context.go(HomeScreen.routes[i]);
          },
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
        body: widget.child,
      );
}
