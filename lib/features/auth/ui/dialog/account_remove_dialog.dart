import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../bloc/auth_cubit.dart';

class AccountRemoveDialog extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    required String id,
  }) =>
      showDialog(
        context: context,
        builder: (context) => AccountRemoveDialog(id: id),
      );

  const AccountRemoveDialog({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: const Text('Are you sure you want to remove this account?'),
        title: Text(id),
        actions: [
          TextButton(
            onPressed: () {
              context.read<AuthCubit>().removeAccount(id);
              context.maybePop();
            },
            child: const Text('Remove'),
          ),
          TextButton(
            onPressed: context.maybePop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
