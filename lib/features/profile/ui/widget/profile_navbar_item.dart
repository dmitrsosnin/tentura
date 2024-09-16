import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/ui/widget/avatar_image.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../bloc/profile_cubit.dart';

class ProfileNavBarItem extends StatelessWidget {
  const ProfileNavBarItem({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileCubit, ProfileState>(
        bloc: GetIt.I<ProfileCubit>(),
        builder: (context, state) {
          final menuController = MenuController();
          final ids = GetIt.I<AuthCubit>()
              .state
              .accounts
              .where((e) => e.id != state.user.id)
              .map((e) => e.id);
          return MenuAnchor(
            controller: menuController,
            menuChildren: [
              _ProfileMenuItem(
                isMe: true,
                profile: state.user,
                key: ValueKey(state.user),
                onTap: menuController.close,
              ),
              for (final id in ids)
                BlocProvider(
                  create: (_) => ProfileCubit(id: id),
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) => _ProfileMenuItem(
                      key: ValueKey(state.user),
                      profile: state.user,
                      onTap: () async {
                        menuController.close();
                        await GetIt.I<AuthCubit>().signIn(state.user.id);
                      },
                    ),
                  ),
                ),
            ],
            child: GestureDetector(
              onLongPress: ids.length > 1 ? menuController.open : null,
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

class _ProfileMenuItem extends StatelessWidget {
  const _ProfileMenuItem({
    required this.profile,
    this.isMe = false,
    this.onTap,
    super.key,
  });

  final bool isMe;
  final User profile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        // onTap: () async {
        //   menuController.close();
        //   if (isMe) return;
        //   await authCubit.signIn(profile.id);
        // },
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: AvatarImage(
                userId: profile.imageId,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                profile.title,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isMe)
              const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.check),
              ),
          ],
        ),
      );
}
