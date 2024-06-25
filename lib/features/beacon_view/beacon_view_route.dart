import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/data/service/remote_api_service.dart';

import 'data/beacon_view_repository.dart';
import 'ui/bloc/beacon_view_cubit.dart';
import 'ui/screen/beacon_view_screen.dart';

GoRoute buildBeaconViewRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
    GoRoute(
      path: pathBeaconView,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => BlocProvider(
        create: (context) => BeaconViewCubit(
          id: state.uri.queryParameters['id'],
          focusCommentId: state.uri.queryParameters['comment_id'],
          initiallyExpanded: state.uri.queryParameters['expanded'] == 'true',
          beaconViewRepository: BeaconViewRepository(
            context.read<RemoteApiService>(),
          ),
        ),
        child: const BeaconViewScreen(),
      ),
    );
