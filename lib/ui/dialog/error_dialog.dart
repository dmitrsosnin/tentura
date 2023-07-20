import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';

class ErrorDialog extends StatelessWidget {
  static Future<void> show({
    required BuildContext context,
    Object? error,
  }) =>
      showDialog<void>(
        context: context,
        builder: (context) => ErrorDialog(error: error),
      );

  final Object? error;

  const ErrorDialog({
    super.key,
    this.error,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text(error.toString()),
        actions: [
          TextButton(
            onPressed: context.pop,
            child: const Text('Close'),
          ),
        ],
      );
}
