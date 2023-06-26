import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
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
            onPressed: Navigator.of(context).pop,
            child: const Text('Close'),
          ),
        ],
      );
}
