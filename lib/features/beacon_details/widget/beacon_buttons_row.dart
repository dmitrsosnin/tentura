import 'package:flutter/material.dart';

import 'package:gravity/entity/beacon.dart';

class BeaconButtonsRow extends StatelessWidget {
  final Beacon beacon;

  const BeaconButtonsRow({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Like\Dislike
        Container(
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
        ),
        const SizedBox(width: 20),
        // Reply
        FilledButton.icon(
          icon: const Icon(Icons.comment_outlined),
          label: Text(beacon.commentsCount.toString()),
          onPressed: () {},
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
