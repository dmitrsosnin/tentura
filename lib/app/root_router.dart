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

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

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
          path: pathRoot,
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: MyFieldRoute.page,
            ),
            AutoRoute(
              page: FavoritesRoute.page,
            ),
            AutoRoute(
              page: ConnectRoute.page,
            ),
            AutoRoute(
              page: UpdatesRoute.page,
            ),
            AutoRoute(
              initial: true,
              page: ProfileMineRoute.page,
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
        ),
        AutoRoute(
          guards: [
            AutoRouteGuard.redirect(
              (resolver) =>
                  authCubit.state.isAuthenticated ? const HomeRoute() : null,
            ),
          ],
          page: AuthLoginRoute.page,
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
        ),
        AutoRoute(
          page: BeaconCreateRoute.page,
        ),
        AutoRoute(
          page: BeaconViewRoute.page,
          path: pathBeaconView,
        ),
        AutoRoute(
          page: RatingRoute.page,
        ),
        AutoRoute(
          page: GraphRoute.page,
        ),
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
