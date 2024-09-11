import 'package:get_it/get_it.dart';
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
          final authCubit = GetIt.I<AuthCubit>();
          final ids = authCubit.state.accounts.map((e) => e.id);
          return MenuAnchor(
            controller: menuController,
            menuChildren: [
              for (final id in ids)
                BlocProvider(
                  create: (_) => ProfileCubit(id: id),
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final isMe = authCubit.checkIfIsMe(state.user.id);
                      return GestureDetector(
                        onTap: () async {
                          menuController.close();
                          if (isMe) return;
                          await authCubit.signIn(state.user.id);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: AvatarImage(
                                userId: state.user.imageId,
                                size: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                state.user.title,
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
                    },
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
