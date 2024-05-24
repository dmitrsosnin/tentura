import 'package:flutter/material.dart';
import 'package:tentura/consts.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';

import 'package:tentura/features/profile/data/user_utils.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_info.dart';
import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/image/ui/widget/avatar_image.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';

import 'beacon_pin_icon_button.dart';
import 'beacon_vote_control.dart';

class BeaconTile extends StatelessWidget {
  const BeaconTile({
    required this.beacon,
    super.key,
  });

  final Beacon beacon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => context.push(Uri(
            path: pathProfileView,
            queryParameters: {'id': beacon.author.id},
          ).toString()),
          child: Row(
            children: [
              // Avatar
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: AvatarImage(
                  userId: beacon.author.imageId,
                  size: 40,
                ),
              ),

              // User displayName
              Text(
                beacon.author.title,
                style: textTheme.headlineMedium,
              ),
            ],
          ),
        ),

        // Beacon Info
        BeaconInfo(beacon: beacon),

        // Beacon Control
        Padding(
          padding: paddingV8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Comments count
              TextButton.icon(
                onPressed: () => context.push(Uri(
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
                    : () => context.push(Uri(
                          path: pathGraph,
                          queryParameters: {'focus': beacon.id},
                        ).toString()),
              ),

              // Share
              ShareCodeIconButton(
                header: beacon.id,
                link: Uri.https(
                  appLinkBase,
                  pathBeaconView,
                  {'id': beacon.id},
                ),
              ),

              // Favorite
              BeaconPinIconButton(beacon: beacon),

              // Like\Dislike
              BeaconVoteControl(
                id: beacon.id,
                votes: beacon.my_vote,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
