import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/data/service/remote_api_service.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

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
        create: (context) => MyFieldCubit(
          id: context.read<AuthCubit>().state.currentAccount,
          myFieldRepository: MyFieldRepository(
            remoteApiService: context.read<RemoteApiService>(),
          ),
        ),
        child: const MyFieldScreen(),
      ),
    );
