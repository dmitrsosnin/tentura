import 'package:flutter/material.dart';

class OnErrorDialog extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    required String text,
  }) =>
      showDialog(
        context: context,
        builder: (_) => OnErrorDialog(text: text),
      );

  const OnErrorDialog({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Close'),
          ),
        ],
      );
}
