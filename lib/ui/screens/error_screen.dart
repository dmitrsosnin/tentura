import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: paddingMediumA,
              child: Text(
                error?.toString() ?? 'Unknown error',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FilledButton(
              onPressed: () => context.navigateNamedTo(pathHomeField),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      );
}
