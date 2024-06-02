import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/widget/avatar_image.dart';
import 'package:tentura/ui/dialog/share_code_dialog.dart';
import 'package:tentura/data/repository/image_repository.dart';
import 'package:tentura/data/gql/gql_client.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/auth/ui/dialog/show_seed_dialog.dart';
import 'package:tentura/features/auth/ui/dialog/account_remove_dialog.dart';

import '../bloc/profile_cubit.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit.build(
        id: id,
        gqlClient: context.read<Client>(),
        imageRepository: context.read<ImageRepository>(),
      ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return ListTile(
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
                    header: id,
                    link: Uri.https(
                      appLinkBase,
                      pathProfileView,
                      {'id': id},
                    ),
                  ),
                ),
                const PopupMenuDivider(),

                // Share account seed
                PopupMenuItem<void>(
                  child: const Text('Show seed'),
                  onTap: () => ShowSeedDialog.show(context, userId: id),
                ),
                const PopupMenuDivider(),

                // Remove account
                PopupMenuItem<void>(
                  child: const Text('Remove from list'),
                  onTap: () => AccountRemoveDialog.show(context, id: id),
                ),
              ],
            ),

            // Log in
            onTap: () async {
              await context.read<AuthCubit>().signIn(id);
              if (context.mounted) context.go(pathHomeProfile);
            },
          );
        },
      ),
    );
  }
}
