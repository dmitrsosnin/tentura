import 'package:flutter/material.dart';

import 'package:tentura/features/graph/domain/entity/node_details.dart';
import 'package:tentura/features/image/ui/widget/avatar_image.dart';
import 'package:tentura/features/image/ui/widget/beacon_image.dart';

class GraphNodeWidget extends StatelessWidget {
  GraphNodeWidget({
    required this.nodeDetails,
    this.onTap,
    this.onDoubleTap,
  }) : super(key: ValueKey(nodeDetails));

  final NodeDetails nodeDetails;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

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
        final CommentNode _ => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Theme.of(context).canvasColor,
              shape: BoxShape.circle,
            ),
            child: const Text('C'),
          ),
      },
    );
    return onTap == null && onDoubleTap == null
        ? widget
        : GestureDetector(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            child: widget,
          );
  }
}
