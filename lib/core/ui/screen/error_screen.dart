import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            onPressed: () => context.go('/'),
            child: const Text('Back to Home'),
          ),
        ),
      );
}
