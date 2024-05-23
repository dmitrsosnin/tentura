import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/widget/share_code_icon_button.dart';

import '../../domain/entity/beacon.dart';
import 'favorite_icon_button.dart';
import 'beacon_vote_control.dart';
import 'beacon_popup_menu.dart';

class BeaconControlRow extends StatelessWidget {
  const BeaconControlRow({
    required this.beacon,
    required this.isMine,
    super.key,
  });

  final Beacon beacon;
  final bool isMine;

  @override
  Widget build(BuildContext context) => Row(
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

          if (isMine)

            // Menu
            BeaconPopupMenu(id: beacon.id)
          else ...[
            // Favorite
            FavoriteIconButton(beacon: beacon),

            // Like\Dislike
            BeaconVoteControl(
              id: beacon.id,
              votes: beacon.my_vote,
            ),
          ],
        ],
      );
}
