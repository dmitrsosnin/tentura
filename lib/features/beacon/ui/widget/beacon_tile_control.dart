import 'package:flutter/material.dart';

import 'package:tentura/app/root_router.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';

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
          IconButton(
            icon: const Icon(Icons.comment_outlined),
            onPressed: () => context.pushRoute(
              BeaconViewRoute(
                id: beacon.id,
                initiallyExpanded: true,
              ),
            ),
          ),

          // Graph View
          IconButton(
            icon: const Icon(Icons.hub_outlined),
            onPressed: (beacon.my_vote ?? -1) < 0
                ? null
                : () => context.pushRoute(GraphRoute(focus: beacon.id)),
          ),

          // Share
          ShareCodeIconButton.id(beacon.id),

          // Favorite
          BeaconPinIconButton(
            id: beacon.id,
            isPinned: beacon.is_pinned,
            key: ValueKey(beacon),
          ),

          // Like\Dislike
          BeaconVoteControl(
            id: beacon.id,
            votes: beacon.myVote,
          ),
        ],
      );
}
