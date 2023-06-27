import 'package:flutter/material.dart';

class LogOutDialog extends StatelessWidget {
  final VoidCallback onYes;

  const LogOutDialog({
    required this.onYes,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you shure?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onYes();
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('No'),
          ),
        ],
      );
}
