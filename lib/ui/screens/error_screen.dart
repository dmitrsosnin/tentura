import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

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
              padding: paddingMediumA,
              child: Text(
                (error ?? GoRouterState.of(context).error).toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            FilledButton(
              onPressed: () => context.go(pathHomeField),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      );
}
