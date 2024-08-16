import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/domain/entity/beacon.dart';

import 'package:tentura/features/app_link/ui/widget/share_code_icon_button.dart';
import 'package:tentura/features/favorites/ui/widget/beacon_pin_icon_button.dart';

import 'beacon_vote_control.dart';

class BeaconTileControl extends StatelessWidget {
  const BeaconTileControl({
    required this.beacon,
    super.key,
  });

  final Beacon beacon;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Comments count
          TextButton.icon(
            onPressed: () => context.router.pushNamed(Uri(
              path: pathBeaconView,
              queryParameters: {
                'id': beacon.id,
                'expanded': 'true',
              },
            ).toString()),
            icon: const Icon(Icons.comment_outlined),
            label: Text(
              beacon.comments_count.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          // Graph View
          IconButton(
            icon: const Icon(Icons.hub_outlined),
            onPressed: (beacon.my_vote ?? -1) < 0
                ? null
                : () => context.router.pushNamed(Uri(
                      path: pathGraph,
                      queryParameters: {'focus': beacon.id},
                    ).toString()),
          ),

          // Share
          ShareCodeIconButton.id(beacon.id),

          // Favorite
          BeaconPinIconButton(
            id: beacon.id,
            isPinned: beacon.is_pinned,
          ),

          // Like\Dislike
          BeaconVoteControl(
            id: beacon.id,
            votes: beacon.my_vote,
          ),
        ],
      );
}
