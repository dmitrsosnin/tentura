import 'package:flutter/material.dart';

import 'package:gravity/features/graph/domain/entity/node_details.dart';

import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';

class GraphNodeWidget extends StatelessWidget {
  static final _decorationUser = BoxDecoration(
    border: Border.all(color: Colors.deepPurple, width: 3),
  );

  static final _decorationBeacon = BoxDecoration(
    border: Border.all(color: Colors.purple, width: 2),
  );

  static final _decorationDefault = BoxDecoration(
    border: Border.all(color: Colors.grey),
  );

  const GraphNodeWidget({
    required this.nodeDetails,
    this.size = 40,
    this.onTap,
    super.key,
  });

  final NodeDetails nodeDetails;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final widget = switch (nodeDetails) {
      final UserNode user => Container(
          foregroundDecoration: _decorationUser,
          child: AvatarImage(
            size: size,
            userId: user.hasImage ? user.id : '',
          ),
        ),
      final BeaconNode beacon => Container(
          width: size,
          foregroundDecoration: _decorationBeacon,
          child: BeaconImage(
            authorId: beacon.userId,
            beaconId: beacon.hasImage ? beacon.id : '',
          ),
        ),
      final CommentNode _ => Container(
          alignment: Alignment.center,
          width: size,
          foregroundDecoration: _decorationDefault,
          child: const Text('C'),
        ),
    };
    return onTap == null
        ? widget
        : GestureDetector(
            onTap: onTap,
            child: widget,
          );
  }
}
