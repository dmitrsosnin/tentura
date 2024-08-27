import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';

import '../bloc/profile_cubit.dart';

class MyProfileDeleteDialog extends StatelessWidget {
  static Future<void> show(BuildContext context) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        builder: (context) => const MyProfileDeleteDialog(),
      );

  const MyProfileDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog.adaptive(
        title: const Text(
          'Are you sure you want to delete your profile?',
        ),
        content: const Text(
          'All your beacons and personal data will be deleted completely.',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final authCubit = context.read<AuthCubit>();
              final myId = authCubit.state.currentAccount;
              final profileCubit = context.read<ProfileCubit>();
              try {
                await profileCubit.delete();
                await authCubit.signOut();
                authCubit.removeAccount(myId);
                if (context.mounted) {
                  await context.maybePop();
                }
              } catch (e) {
                if (context.mounted) {
                  showSnackBar(
                    context,
                    isError: true,
                    text: e.toString(),
                  );
                  await context.maybePop();
                }
              }
            },
            child: const Text('Delete'),
          ),
          TextButton(
            onPressed: context.maybePop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
