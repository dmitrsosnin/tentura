import 'package:flutter/material.dart';

class RatingButton extends StatelessWidget {
  static const width = 120.0;

  const RatingButton({super.key});

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
        label: const Text('71%'),
        icon: const Icon(Icons.percent_rounded),
        style: const ButtonStyle(
          visualDensity: VisualDensity.compact,
        ),
        onPressed: () {},
      );
}
