import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.child,
    super.key,
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
      // Debug
      drawer: const DrawerWithColors(),
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

class DrawerWithColors extends StatelessWidget {
  const DrawerWithColors({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Drawer(
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 20, height: 2),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text('Primary',
                style: TextStyle(
                  backgroundColor: colorScheme.primary,
                  color: colorScheme.onPrimary,
                )),
            Text('onPrimaryContainer',
                style: TextStyle(
                  backgroundColor: colorScheme.primaryContainer,
                  color: colorScheme.onPrimaryContainer,
                )),
            Text('Secondary',
                style: TextStyle(
                  backgroundColor: colorScheme.secondary,
                  color: colorScheme.onSecondary,
                )),
            Text('SecondaryContainer',
                style: TextStyle(
                  backgroundColor: colorScheme.secondaryContainer,
                  color: colorScheme.onSecondaryContainer,
                )),
            Text('Tertiary',
                style: TextStyle(
                  backgroundColor: colorScheme.tertiary,
                  color: colorScheme.onTertiary,
                )),
            Text('TertiaryContainer',
                style: TextStyle(
                  backgroundColor: colorScheme.tertiaryContainer,
                  color: colorScheme.onTertiaryContainer,
                )),
            Text('Background',
                style: TextStyle(
                  backgroundColor: colorScheme.background,
                  color: colorScheme.onBackground,
                )),
            Text('Surface',
                style: TextStyle(
                  backgroundColor: colorScheme.surface,
                  color: colorScheme.onSurface,
                )),
            Text('SurfaceVariant',
                style: TextStyle(
                  backgroundColor: colorScheme.surfaceVariant,
                  color: colorScheme.onSurfaceVariant,
                )),
            Text('Error',
                style: TextStyle(
                  backgroundColor: colorScheme.error,
                  color: colorScheme.onError,
                )),
            Text('scaffoldBackgroundColor',
                style: TextStyle(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  color: theme.primaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
