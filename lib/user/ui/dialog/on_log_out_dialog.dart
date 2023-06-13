import 'package:flutter/material.dart';

class OnLogOutDialog extends StatelessWidget {
  static Future<bool?> show(BuildContext context) => showDialog<bool>(
        context: context,
        builder: (_) => const OnLogOutDialog(),
      );

  const OnLogOutDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you shure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('No'),
          ),
        ],
      );
}
