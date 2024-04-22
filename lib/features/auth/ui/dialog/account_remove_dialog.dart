import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountRemoveDialog extends StatelessWidget {
  static Future<bool?> show(
    BuildContext context, {
    required String id,
  }) =>
      showDialog<bool>(
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
            onPressed: () => context.pop(true),
            child: const Text('Remove'),
          ),
          TextButton(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
