import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/dialog/share_code_dialog.dart';
import 'package:tentura/features/beacon/data/beacon_utils.dart';

import 'beacon_popup_menu.dart';
import 'beacon_vote_control.dart';
import 'favorite_icon_button.dart';

class BeaconControlRow extends StatelessWidget {
  final GBeaconFields beacon;
  final bool isMine;

  const BeaconControlRow({
    required this.beacon,
    required this.isMine,
    super.key,
  });

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
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => ShareCodeDialog(
                id: beacon.id,
                link: Uri.https(
                  appLinkBase,
                  pathBeaconView,
                  {'id': beacon.id},
                ).toString(),
              ),
            ),
          ),
          if (isMine)
            // Menu
            BeaconPopupMenu(beacon: beacon)
          else ...[
            // Favorite
            FavoriteIconButton(beacon: beacon),
            // Like\Dislike
            BeaconVoteControl(beacon: beacon),
          ],
        ],
      );
}
