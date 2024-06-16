import 'package:flutter/material.dart';

import 'package:tentura/ui/widget/avatar_image.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../bloc/profile_cubit.dart';

class ProfileNavBarItem extends StatelessWidget {
  const ProfileNavBarItem({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (p, c) => p.user.imageId != c.user.imageId,
        builder: (context, state) {
          final menuController = MenuController();
          final authCubit = context.read<AuthCubit>();
          return MenuAnchor(
            controller: menuController,
            menuChildren: [
              for (final id in authCubit.state.accounts.keys)
                BlocProvider(
                  create: (context) => ProfileCubit.dummy(userId: id),
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) => ListTile(
                      leading: AvatarImage(
                        userId: state.user.imageId,
                        size: 40,
                      ),
                      title: Text(state.user.title),
                      onTap: () => authCubit.signIn(state.user.id),
                    ),
                  ),
                ),
            ],
            child: GestureDetector(
              onLongPress: menuController.open,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: AvatarImage(
                  userId: state.user.has_picture ? state.user.id : '',
                  size: 36,
                ),
              ),
            ),
          );
        },
      );
}
