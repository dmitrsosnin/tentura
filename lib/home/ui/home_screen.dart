import 'package:flutter/material.dart';

import 'package:gravity/_app/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      body: child,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: child.currentIndex,
        showSelectedLabels: false,
        onTap: child.goBranch,
        items: [
          _generateNavBarItem(
            Icons.home_outlined,
            'My field',
            color,
          ),
          _generateNavBarItem(
            Icons.list_alt_rounded,
            'Beacons',
            color,
          ),
          _generateNavBarItem(
            Icons.notifications_none_outlined,
            'Updates',
            color,
          ),
          _generateNavBarItem(
            Icons.account_circle_outlined,
            'Profile',
            color,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _generateNavBarItem(
    IconData icon,
    String label,
    Color primaryColor,
  ) =>
      BottomNavigationBarItem(
        activeIcon: Center(
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 4),
                Text(label, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        icon: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(icon, color: primaryColor),
          ),
        ),
        label: label,
      );
}
