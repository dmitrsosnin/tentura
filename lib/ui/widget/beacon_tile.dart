import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';

import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';

import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';
import 'package:gravity/ui/widget/like_control_button.dart';

class BeaconTile extends StatelessWidget {
  static final _dF = DateFormat.yMd();

  final GBeaconFields beacon;

  const BeaconTile({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: AvatarImage(
              size: 40,
              userId: beacon.author.imageId,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // User displayName
                    Text(
                      beacon.author.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(width: 16),
                    // Date
                    Text(_dF.format(beacon.created_at)),
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
                const SizedBox(height: 16),
                // Beacon Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: BeaconImage(
                    authorId: beacon.author.id,
                    beaconId: beacon.imageId,
                    width: 300,
                  ),
                ),
                const SizedBox(height: 16),
                // Beacon Title
                Text(
                  beacon.title,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                // Beacon Description
                Text(
                  beacon.description,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                // Bottom Buttons Block
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      // Like\Dislike
                      LikeControlButton(beacon: beacon),
                      const SizedBox(width: 20),
                      // Comments count
                      OutlinedButton.icon(
                        icon: const Icon(Icons.comment_outlined),
                        label: Text(beacon.comments_count.toString()),
                        onPressed: () => context.push(Uri(
                          path: pathBeaconDetails,
                          queryParameters: {'id': beacon.id},
                        ).toString()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
