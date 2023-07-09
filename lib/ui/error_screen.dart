import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Error'),
        ),
        body: Center(
          child: FilledButton(
            onPressed: () => context.go(pathField),
            child: const Text('Back to Home'),
          ),
        ),
      );
}
