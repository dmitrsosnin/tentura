import 'package:flutter/material.dart';

class MyRatingWidget extends StatelessWidget {
  const MyRatingWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
      );
}
