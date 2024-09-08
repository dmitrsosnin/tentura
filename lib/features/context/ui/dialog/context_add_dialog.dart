import 'package:flutter/material.dart';

import '../bloc/context_cubit.dart';

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
            onPressed: () async {
              final newContext = _controller.text.trim();
              await context.read<ContextCubit>().add(
                    name: newContext,
                    select: true,
                  );
              if (context.mounted) Navigator.of(context).pop(newContext);
            },
            child: const Text('Ok'),
          ),
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
