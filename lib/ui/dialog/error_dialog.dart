import 'package:flutter/material.dart';

import 'package:tentura/app/router.dart';

class ErrorDialog extends StatelessWidget {
  final Object? error;

  const ErrorDialog({
    super.key,
    this.error,
  });

  @override
  Widget build(BuildContext context) => AlertDialog.adaptive(
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
