import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/app/root_router.gr.dart';

import 'package:tentura/features/profile/ui/widget/profile_navbar_item.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
        bottomNavigationBuilder: (context, tabsRouter) => NavigationBar(
          onDestinationSelected: tabsRouter.setActiveIndex,
          selectedIndex: tabsRouter.activeIndex,
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
            ),
            NavigationDestination(
              icon: ProfileNavBarItem(),
              label: 'Profile',
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        routes: const [
          MyFieldRoute(),
          FavoritesRoute(),
          ConnectRoute(),
          UpdatesRoute(),
          ProfileMineRoute(),
        ],
      );
}
