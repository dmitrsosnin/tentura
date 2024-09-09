import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/settings/ui/bloc/settings_cubit.dart';

import 'root_router.gr.dart';

export 'package:auto_route/auto_route.dart';

export 'root_router.gr.dart';

const pathRoot = '/';
const pathConnect = '/connect';
const pathBeaconView = '/beacon/view';
const pathProfileView = '/profile/view';
const pathAppLinkView = '/shared/view';

@AutoRouterConfig()
class RootRouter extends RootStackRouter {
  late final reevaluateListenable = _ReevaluateFromStreams([
    authCubit.stream.map((e) => e.currentAccountId),
    settingsCubit.stream.map((e) => e.introEnabled),
  ]);

  late AuthCubit authCubit;
  late SettingsCubit settingsCubit;

  @override
  void dispose() {
    reevaluateListenable.dispose();
    super.dispose();
  }

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        // Home
        AutoRoute(
          guards: [
            AutoRouteGuard.redirect(
              (resolver) =>
                  settingsCubit.state.introEnabled ? const IntroRoute() : null,
            ),
            AutoRouteGuard.redirect(
              (resolver) => authCubit.state.isAuthenticated
                  ? null
                  : const AuthLoginRoute(),
            ),
          ],
          initial: true,
          path: pathRoot,
          page: HomeRoute.page,
          children: [
            // Field
            AutoRoute(
              page: MyFieldRoute.page,
            ),
            // Favorites
            AutoRoute(
              page: FavoritesRoute.page,
            ),
            // Connect
            AutoRoute(
              page: ConnectRoute.page,
            ),
            // Updates
            AutoRoute(
              page: UpdatesRoute.page,
            ),
            // Profile
            AutoRoute(
              initial: true,
              page: ProfileMineRoute.page,
            ),
          ],
        ),

        // Intro
        AutoRoute(
          guards: [
            AutoRouteGuard.redirect(
              (resolver) => settingsCubit.state.introEnabled
                  ? null
                  : const AuthLoginRoute(),
            ),
          ],
          page: IntroRoute.page,
        ),

        // Login
        AutoRoute(
          guards: [
            AutoRouteGuard.redirect(
              (resolver) =>
                  authCubit.state.isAuthenticated ? const HomeRoute() : null,
            ),
          ],
          page: AuthLoginRoute.page,
        ),

        // Profile
        AutoRoute(
          page: ProfileViewRoute.page,
          path: pathProfileView,
          guards: [
            AutoRouteGuard.redirect(
              (r) => authCubit.checkIfIsMe(r.route.queryParams.getString('id'))
                  ? const ProfileMineRoute()
                  : null,
            ),
          ],
        ),
        AutoRoute(
          page: ProfileEditRoute.page,
        ),

        //Beacon
        AutoRoute(
          page: BeaconCreateRoute.page,
        ),
        AutoRoute(
          page: BeaconViewRoute.page,
          path: pathBeaconView,
        ),

        // Rating
        AutoRoute(
          page: RatingRoute.page,
        ),

        // Graph
        AutoRoute(
          page: GraphRoute.page,
        ),

        // default
        RedirectRoute(
          path: '*',
          redirectTo: pathRoot,
        ),
      ];
}

class _ReevaluateFromStreams extends ChangeNotifier {
  final _subscriptions = <StreamSubscription<dynamic>>[];

  _ReevaluateFromStreams(List<Stream<dynamic>> streams) {
    for (final stream in streams) {
      _subscriptions.add(stream.listen((_) => notifyListeners()));
    }
  }

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
