import 'package:flutter/material.dart';

import 'package:tentura/data/service/local_secure_storage.dart';
import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/ui/widget/avatar_image.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../../data/repository/profile_local_repository.dart';
import '../../data/repository/profile_remote_repository.dart';
import '../../domain/use_case/profile_case.dart';
import '../bloc/profile_cubit.dart';

class ProfileNavBarItem extends StatelessWidget {
  const ProfileNavBarItem({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (p, c) => p.user.imageId != c.user.imageId,
        builder: (context, state) {
          final menuController = MenuController();
          final authCubit = context.read<AuthCubit>();
          final ids = authCubit.state.accounts.map((e) => e.id);
          // TBD: use GetIt
          final profileCase = ProfileCase(
            profileLocalRepository: ProfileLocalRepository(
              context.read<LocalSecureStorage>(),
            ),
            profileRemoteRepository: ProfileRemoteRepository(
              context.read<RemoteApiService>(),
            ),
          );
          return MenuAnchor(
            controller: menuController,
            menuChildren: [
              for (final id in ids)
                BlocProvider(
                  create: (context) => ProfileCubit(profileCase, id: id),
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final isMe = authCubit.checkIfIsMe(state.user.id);
                      return GestureDetector(
                        onTap: isMe
                            ? menuController.close
                            : () => authCubit.signIn(state.user.id),
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
