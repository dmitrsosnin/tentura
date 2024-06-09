import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/data/service/remote_api_service.dart';

import 'data/my_field_repository.dart';
import 'ui/bloc/my_field_cubit.dart';
import 'ui/screen/my_field_screen.dart';

GoRoute buildMyFieldRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathHomeField,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => BlocProvider(
        create: (context) {
          final remoteApiService = context.read<RemoteApiService>();
          return MyFieldCubit(
            repository: MyFieldRepository(remoteApiService),
            hasTokenChanges: remoteApiService.hasTokenChanges,
          );
        },
        child: const MyFieldScreen(),
      ),
    );
