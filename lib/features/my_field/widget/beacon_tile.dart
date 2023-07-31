import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';
import 'package:gravity/features/beacon_details/widget/beacon_vote_control.dart';

class BeaconTile extends StatelessWidget {
  final GBeaconFields beacon;

  const BeaconTile({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Avatar
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: AvatarImage(
                size: 40,
                userId: beacon.author.imageId,
              ),
            ),
            // User displayName
            Text(
              beacon.author.title,
              style: textTheme.headlineMedium,
            ),
            const Spacer(),
            // Menu
            PopupMenuButton(
              itemBuilder: (context) => const [
                PopupMenuItem<void>(
                  child: Text('Hide from My field'),
                ),
                PopupMenuItem<void>(
                  child: Text('Share the code'),
                ),
              ],
            ),
          ],
        ),
        // Beacon Title
        Text(
          beacon.title,
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: textTheme.headlineLarge,
        ),
        // Beacon Image
        GestureDetector(
          onTap: () => context.push(Uri(
            path: pathBeaconDetails,
            queryParameters: {'id': beacon.id},
          ).toString()),
          child: Padding(
            padding: paddingV8,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: BeaconImage(
                authorId: beacon.author.id,
                beaconId: beacon.imageId,
                width: 300,
              ),
            ),
          ),
        ),
        // Beacon Description
        Text(
          beacon.description,
          maxLines: 3,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyLarge,
        ),
        // Comments count
        Padding(
          padding: paddingV8,
          child: Text(
            'Comments: ${beacon.comments_count}',
            style: textTheme.bodyLarge,
          ),
        ),
        // Like\Dislike
        Padding(
          padding: paddingV8,
          child: BeaconVoteControl(beacon: beacon),
        ),
      ],
    );
  }
}
