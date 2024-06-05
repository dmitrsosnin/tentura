import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/connect/connect_route.dart';
import 'package:tentura/features/favorites/favorites_route.dart';
import 'package:tentura/features/my_field/my_field_route.dart';
import 'package:tentura/features/profile/profile_mine_route.dart';
import 'package:tentura/features/updates/updates_route.dart';

import 'ui/screen/home_screen.dart';

StatefulShellRoute buildHomeRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state, child) => HomeScreen(child: child),
      redirect: (context, state) =>
          context.read<AuthCubit>().isAuthenticated ? null : pathAuthLogin,
      branches: [
        StatefulShellBranch(
          routes: [
            buildMyFieldRoute(),
          ],
        ),
        StatefulShellBranch(
          routes: [
            buildFavoritesRoute(),
          ],
        ),
        StatefulShellBranch(
          routes: [
            buildConnectRoute(),
          ],
        ),
        StatefulShellBranch(
          routes: [
            buildUpdatesRoute(),
          ],
        ),
        StatefulShellBranch(
          routes: [
            buildProfileMineRoute(),
          ],
        ),
      ],
    );
