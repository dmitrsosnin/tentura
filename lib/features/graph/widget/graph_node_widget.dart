import 'package:flutter/material.dart';

import 'package:gravity/features/graph/domain/entity/node_details.dart';

import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';

class GraphNodeWidget extends StatelessWidget {
  GraphNodeWidget({
    required this.nodeDetails,
    this.onTap,
  }) : super(key: ValueKey(nodeDetails));

  final NodeDetails nodeDetails;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final widget = SizedBox.square(
      dimension: nodeDetails.size,
      child: switch (nodeDetails) {
        final UserNode user => AvatarImage(
            size: nodeDetails.size,
            userId: user.hasImage ? user.id : '',
          ),
        final BeaconNode beacon => BeaconImage(
            authorId: beacon.userId,
            beaconId: beacon.hasImage ? beacon.id : '',
          ),
        final CommentNode _ => DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
      },
    );
    return onTap == null
        ? widget
        : GestureDetector(
            onTap: onTap,
            child: widget,
          );
  }
}
