import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ContextAddDialog extends StatefulWidget {
  static Future<String?> show(BuildContext context) => showDialog<String>(
        context: context,
        useRootNavigator: false,
        builder: (context) => const ContextAddDialog(),
      );

  const ContextAddDialog({super.key});

  @override
  State<ContextAddDialog> createState() => _ContextAddDialogState();
}

class _ContextAddDialogState extends State<ContextAddDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog.adaptive(
        title: const Text('Adding a new context'),
        content: TextField(
          controller: _controller,
        ),
        actions: [
          TextButton(
            onPressed: () => context.maybePop(_controller.text.trim()),
            child: const Text('Ok'),
          ),
          TextButton(
            onPressed: context.maybePop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
