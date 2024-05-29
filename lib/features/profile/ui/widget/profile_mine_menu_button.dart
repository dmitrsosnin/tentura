import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/auth/ui/dialog/show_seed_dialog.dart';

class ProfileMineMenuButton extends StatelessWidget {
  const ProfileMineMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => <PopupMenuEntry<void>>[
        PopupMenuItem<void>(
          onTap: () => context.push(pathRating),
          child: const Text('View rating'),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<void>(
          child: const Text('Show seed'),
          onTap: () => ShowSeedDialog.show(
            context,
            userId: context.read<AuthCubit>().id,
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<void>(
          onTap: () => context.push(pathProfileEdit),
          child: const Text('Edit profile'),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<void>(
          onTap: () {},
          child: const Text('Settings'),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<void>(
          onTap: () async {
            context.go(pathAuthLogin);
            await Future.delayed(
              const Duration(seconds: 1),
              context.read<AuthCubit>().signOut,
            );
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
