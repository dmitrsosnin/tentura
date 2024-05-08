import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/utils/ui_consts.dart';

class InputCodeDialog extends StatelessWidget {
  const InputCodeDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog.adaptive(
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Close'),
          ),
        ],
        title: const Text(
          'Enter code',
          textAlign: TextAlign.center,
        ),
        contentPadding: paddingAll20,
        content: TextField(
          maxLength: idLength,
          onChanged: (value) {
            if (value.length == idLength) {
              Navigator.of(context).pop(value);
            }
          },
        ),
      );
}
