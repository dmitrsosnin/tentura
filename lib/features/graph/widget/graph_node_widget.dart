import 'package:flutter/material.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/domain/entity/graph_node.dart';

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
    required this.node,
    this.onTap,
    super.key,
  });

  final Node<GraphNode> node;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: switch (node) {
          final Node<GUserFields> node => Container(
              foregroundDecoration: _decorationUser,
              child: AvatarImage(
                size: node.size,
                userId: node.data.imageId,
              ),
            ),
          final Node<GBeaconFields> node => Container(
              width: node.size,
              foregroundDecoration: _decorationBeacon,
              child: BeaconImage(
                authorId: node.data.author.id,
                beaconId: node.data.imageId,
              ),
            ),
          _ => Container(
              width: node.size,
              height: node.size,
              foregroundDecoration: _decorationDefault,
            ),
        },
      );
}
