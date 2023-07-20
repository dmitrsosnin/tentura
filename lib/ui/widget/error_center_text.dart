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
  Widget build(BuildContext context) => Center(
        child: Text(
          error != null
              ? error.toString()
              : response?.linkException != null
                  ? response!.linkException.toString()
                  : response?.graphqlErrors != null
                      ? response!.graphqlErrors.toString()
                      : 'Unknown error!',
          style: const TextStyle(color: Colors.red),
        ),
      );
}
