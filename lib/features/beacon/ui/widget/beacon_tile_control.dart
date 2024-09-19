import 'package:flutter/material.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/tentura_icons.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';

import 'package:tentura/features/like/ui/widget/like_beacon_control.dart';
import 'package:tentura/features/favorites/ui/widget/beacon_pin_icon_button.dart';

class BeaconTileControl extends StatelessWidget {
  const BeaconTileControl({
    required this.beacon,
    super.key,
  });

  final Beacon beacon;

  @override
  Widget build(BuildContext context) => Padding(
        padding: kPaddingSmallT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Comments count
            IconButton(
              icon: const Icon(TenturaIcons.comments),
              onPressed: () => context.pushRoute(
                BeaconViewRoute(
                  id: beacon.id,
                  initiallyExpanded: true,
                ),
              ),
            ),

            // Graph View
            IconButton(
              icon: const Icon(TenturaIcons.graph),
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
            LikeBeaconControl(
              id: beacon.id,
              votes: beacon.my_vote ?? 0,
            ),
          ],
        ),
      );
}
