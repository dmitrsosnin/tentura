import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/consts.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/settings/ui/bloc/settings_cubit.dart';

import 'root_router.gr.dart';

@AutoRouterConfig()
class RootRouter extends RootStackRouter {
  late final reevaluateListenable = _ReevaluateFromStreams([
    authCubit.stream.map((e) => e.currentAccount),
    settingsCubit.stream.map((e) => e.introEnabled),
  ]);

  late AuthCubit authCubit;
  late SettingsCubit settingsCubit;

  @override
  void dispose() {
    reevaluateListenable.dispose();
    super.dispose();
  }

  // @override
  // late final List<AutoRouteGuard> guards = [
  //   AutoRouteGuard.redirect(
  //     (resolver) {
  //       if (settingsCubit.state.introEnabled) return const IntroRoute();
  //       if (anonymousPaths.contains(resolver.routeName)) return null;
  //       if (authCubit.state.isAuthenticated) return null;
  //       return const AuthLoginRoute();
  //     },
  //   ),
  // ];

  // @override
  // RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
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
          path: '/',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: MyFieldRoute.page,
              // path: 'home/my_field',
            ),
            AutoRoute(
              page: FavoritesRoute.page,
              // path: 'home/favorites',
            ),
            AutoRoute(
              page: ConnectRoute.page,
              // path: 'home/connect',
            ),
            AutoRoute(
              page: UpdatesRoute.page,
              // path: 'home/updates',
            ),
            AutoRoute(
              page: ProfileMineRoute.page,
              // path: 'home/profile',
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          guards: [
            AutoRouteGuard.redirect(
              (resolver) => settingsCubit.state.introEnabled
                  ? null
                  : const AuthLoginRoute(),
            ),
          ],
          page: IntroRoute.page,
          // path: pathIntro,
        ),
        AutoRoute(
          guards: [
            AutoRouteGuard.redirect(
              (resolver) =>
                  authCubit.state.isAuthenticated ? const HomeRoute() : null,
            ),
          ],
          page: AuthLoginRoute.page,
          // path: pathAuthLogin,
        ),
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
          path: pathProfileEdit,
        ),
        AutoRoute(
          page: BeaconCreateRoute.page,
          path: pathBeaconCreate,
        ),
        AutoRoute(
          page: BeaconViewRoute.page,
          path: pathBeaconView,
        ),
        AutoRoute(
          page: RatingRoute.page,
          path: pathRating,
        ),
        AutoRoute(
          page: GraphRoute.page,
          path: pathGraph,
        ),
        RedirectRoute(
          path: '*',
          redirectTo: '/',
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
