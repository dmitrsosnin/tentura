import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/app/root_router.dart';
import 'package:tentura/data/service/local_secure_storage.dart';
import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/ui/dialog/share_code_dialog.dart';
import 'package:tentura/ui/widget/avatar_image.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/auth/ui/dialog/show_seed_dialog.dart';
import 'package:tentura/features/auth/ui/dialog/account_remove_dialog.dart';

import '../../data/repository/profile_local_repository.dart';
import '../../data/repository/profile_remote_repository.dart';
import '../../domain/use_case/profile_case.dart';
import '../bloc/profile_cubit.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({
    required this.userId,
    super.key,
  });

  final String userId;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ProfileCubit(
          // TBD: use GetIt
          ProfileCase(
            profileLocalRepository: ProfileLocalRepository(
              context.read<LocalSecureStorage>(),
            ),
            profileRemoteRepository: ProfileRemoteRepository(
              context.read<RemoteApiService>(),
            ),
          ),
          id: userId,
        ),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) => ListTile(
            leading: AvatarImage(
              userId: state.user.imageId,
              size: 40,
            ),
            title: Text(state.user.title),
            trailing: PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry<void>>[
                // Share account code
                PopupMenuItem<void>(
                  child: const Text('Share account'),
                  onTap: () => ShareCodeDialog.show(
                    context,
                    header: userId,
                    link: Uri.https(
                      appLinkBase,
                      pathAppLinkView,
                      {'id': userId},
                    ),
                  ),
                ),
                const PopupMenuDivider(),

                // Share account seed
                PopupMenuItem<void>(
                  child: const Text('Show seed'),
                  onTap: () => ShowSeedDialog.show(context, userId: userId),
                ),
                const PopupMenuDivider(),

                // Remove account
                PopupMenuItem<void>(
                  child: const Text('Remove from list'),
                  onTap: () => AccountRemoveDialog.show(context, id: userId),
                ),
              ],
            ),

            // Log in
            onTap: () => context.read<AuthCubit>().signIn(userId),
          ),
        ),
      );
}
