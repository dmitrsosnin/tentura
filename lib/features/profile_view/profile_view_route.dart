import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/data/service/remote_api_service.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import 'data/profile_view_repository.dart';
import 'ui/cubit/profile_view_cubit.dart';
import 'ui/screen/profile_view_screen.dart';

GoRoute buildProfileViewRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathProfileView,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => BlocProvider(
        create: (context) => ProfileViewCubit(
          id: state.uri.queryParameters['id'] ?? '',
          profileViewRepository: ProfileViewRepository(
            remoteApiService: context.read<RemoteApiService>(),
          ),
        ),
        child: const ProfileViewScreen(),
      ),
      redirect: (context, state) => context
              .read<AuthCubit>()
              .checkIfIsMe(state.uri.queryParameters['id'] ?? '')
          ? pathHomeProfile
          : null,
    );
