import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/features/profile/ui/bloc/profile_cubit.dart';

import 'data/graph_repository.dart';
import 'ui/bloc/graph_cubit.dart';
import 'ui/screen/graph_screen.dart';

GoRoute buildGraphRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
    GoRoute(
      path: pathGraph,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => BlocProvider(
        create: (context) => GraphCubit(
          focus: state.uri.queryParameters['focus'],
          me: context.read<ProfileCubit>().state.user,
          graphRepository: GraphRepository(context.read<RemoteApiService>()),
        ),
        child: const GraphScreen(),
      ),
    );
