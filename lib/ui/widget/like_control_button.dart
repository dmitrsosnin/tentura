import 'package:flutter/material.dart';

class LikeControlButton extends StatelessWidget {
  final String beaconId;

  const LikeControlButton({
    required this.beaconId,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.thumb_up_outlined),
              onPressed: () {},
            ),
            const Text('10'),
            IconButton(
              icon: const Icon(Icons.thumb_down_outlined),
              onPressed: () {},
            ),
          ],
        ),
      );
}
