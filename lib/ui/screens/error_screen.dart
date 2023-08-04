import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/ui/consts.dart';

class ErrorScreen extends StatelessWidget {
  final String? title;
  final Object? error;

  const ErrorScreen({
    this.title = 'Error',
    this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: title == null ? null : Text(title!),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: paddingAll20,
              child: Text(error?.toString() ?? 'Something went wrong!'),
            ),
            FilledButton(
              onPressed: () => context.go(pathField),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      );
}
