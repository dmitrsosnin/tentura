import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';

class ErrorCenterText extends StatelessWidget {
  const ErrorCenterText({
    this.response,
    this.error,
    super.key,
  });

  final Object? error;
  final OperationResponse<dynamic, dynamic>? response;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Text(
          error?.toString() ??
              response?.linkException?.toString() ??
              response?.graphqlErrors?.toString() ??
              'Unknown error!',
          style: const TextStyle(color: Colors.red),
        ),
      );
}
