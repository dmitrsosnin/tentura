import 'package:flutter/material.dart';

import 'package:gravity/consts.dart';
import 'package:gravity/app/router.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';

import 'package:gravity/ui/dialog/share_code_dialog.dart';
import 'package:gravity/features/beacon/widget/beacon_vote_control.dart';

import 'beacon_popup_menu.dart';

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
            onPressed: () => context.push(Uri(
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
          else
            // Like\Dislike
            BeaconVoteControl(beacon: beacon),
        ],
      );
}
