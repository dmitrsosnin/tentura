import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ContextRemoveDialog extends StatelessWidget {
  static Future<bool?> show(BuildContext context) => showDialog<bool>(
        context: context,
        useRootNavigator: false,
        builder: (context) => const ContextRemoveDialog(),
      );

  const ContextRemoveDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog.adaptive(
        title: const Text('Are you shure?'),
        actions: [
          TextButton(
            onPressed: () => context.maybePop(true),
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: context.maybePop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
