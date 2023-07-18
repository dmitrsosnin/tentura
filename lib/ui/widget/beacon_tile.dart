import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';

import 'package:gravity/data/gql/beacon/_g/_fragments.data.gql.dart';
import 'package:gravity/ui/widget/like_control_button.dart';

class BeaconTile extends StatelessWidget {
  static final _dF = DateFormat.yMd();

  final GbeaconFields beacon;

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
              userId: beacon.author.has_picture ? beacon.author.id : '',
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
                        PopupMenuItem<void>(child: Text('Share the code')),
                        PopupMenuItem<void>(child: Text('Graph view')),
                      ],
                    ),
                  ],
                ),
                // Beacon Image
                Container(
                  width: 300,
                  height: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: BeaconImage(
                    authorId: beacon.author.id,
                    beaconId: beacon.has_picture ? beacon.id : '',
                  ),
                ),
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
                      LikeControlButton(beaconId: beacon.id),
                      const SizedBox(width: 20),
                      // Comments count
                      OutlinedButton.icon(
                        icon: const Icon(Icons.comment_outlined),
                        label: Text(beacon.comments_count.toString()),
                        onPressed: null,
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
