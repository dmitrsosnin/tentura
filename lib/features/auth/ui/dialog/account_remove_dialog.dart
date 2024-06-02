import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              context.pop();
            },
            child: const Text('Remove'),
          ),
          TextButton(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
