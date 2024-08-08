import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

GoRoute buildAppLinkViewRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathAppLinkView,
      parentNavigatorKey: parentNavigatorKey,
      redirect: (context, state) => replaceAppLinkPath(state.uri),
    );

String replaceAppLinkPath(Uri uri) => switch (uri.queryParameters['id']) {
      final String id when id.startsWith('U') => Uri(
          path: pathProfileView,
          queryParameters: uri.queryParameters,
        ).toString(),
      final String id when id.startsWith('B') => Uri(
          path: pathBeaconView,
          queryParameters: uri.queryParameters,
        ).toString(),
      final String id when id.startsWith('C') => Uri(
          path: pathBeaconView,
          queryParameters: uri.queryParameters,
        ).toString(),
      _ => pathHomeConnect,
    };
