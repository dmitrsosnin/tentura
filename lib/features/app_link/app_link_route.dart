import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

GoRoute buildBeaconViewRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
    GoRoute(
      path: pathSharedView,
      parentNavigatorKey: parentNavigatorKey,
      redirect: (context, state) => switch (state.uri.queryParameters['id']) {
        final String id when id.startsWith('U') => Uri(
            path: pathProfileView,
            queryParameters: state.uri.queryParameters,
          ).toString(),
        final String id when id.startsWith('B') => Uri(
            path: pathBeaconView,
            queryParameters: state.uri.queryParameters,
          ).toString(),
        final String id when id.startsWith('C') => Uri(
            path: pathBeaconView,
            queryParameters: state.uri.queryParameters,
          ).toString(),
        _ => pathHomeConnect,
      },
    );
