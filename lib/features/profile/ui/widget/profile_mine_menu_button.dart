import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/auth/ui/dialog/show_seed_dialog.dart';
import 'package:tentura/features/settings/ui/bloc/settings_cubit.dart';
import 'package:tentura/features/settings/ui/widget/theme_switch_button.dart';

class ProfileMineMenuButton extends StatelessWidget {
  const ProfileMineMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return PopupMenuButton(
      itemBuilder: (context) => <PopupMenuEntry<void>>[
        // Rating
        PopupMenuItem<void>(
          onTap: () => context.push(pathRating),
          child: const Text('View rating'),
        ),
        const PopupMenuDivider(),

        // Seed
        PopupMenuItem<void>(
          child: const Text('Show seed'),
          onTap: () => ShowSeedDialog.show(
            context,
            userId: authCubit.state.currentAccount,
          ),
        ),
        const PopupMenuDivider(),

        // Edit
        PopupMenuItem<void>(
          onTap: () => context.push(pathProfileEdit),
          child: const Text('Edit profile'),
        ),
        const PopupMenuDivider(),

        // Theme
        const PopupMenuItem<void>(
          child: ThemeSwitchButton(),
        ),
        const PopupMenuDivider(),

        // Intro
        PopupMenuItem<void>(
          onTap: () => context.read<SettingsCubit>().setIntroEnabled(true),
          child: const Text('Show intro again'),
        ),
        const PopupMenuDivider(),

        //Logout
        PopupMenuItem<void>(
          onTap: authCubit.signOut,
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
