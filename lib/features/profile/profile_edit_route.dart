import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'ui/bloc/profile_cubit.dart';
import 'ui/screen/profile_edit_screen.dart';

GoRoute buildProfileEditRoute({
  GlobalKey<NavigatorState>? parentNavigatorKey,
}) =>
    GoRoute(
      path: pathProfileEdit,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const ProfileEditScreen(),
      redirect: (context, state) =>
          context.read<ProfileCubit>().id.isEmpty ? pathAuthLogin : null,
    );
