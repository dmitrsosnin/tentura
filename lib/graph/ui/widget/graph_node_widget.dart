import 'package:flutter/material.dart';

import 'package:gravity/graph/entity/graph_node.dart';
import 'package:gravity/_shared/ui/widget/future_image.dart';
import 'package:gravity/_shared/ui/widget/placeholder_image.dart';

class GraphNodeWidget extends StatelessWidget {
  static final _decorationUser = BoxDecoration(
    border: Border.all(color: Colors.deepPurple, width: 3),
  );

  static final _decorationBeacon = BoxDecoration(
    border: Border.all(color: Colors.deepPurple, width: 2),
  );

  const GraphNodeWidget({
    required this.node,
    this.onTap,
    super.key,
  });

  final GraphNode node;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: switch (node) {
          final UserNode node => Container(
              width: node.size,
              height: node.size,
              foregroundDecoration: _decorationUser,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: FutureImage(
                  futureImage: node.futureImage,
                  placeholder: const PlaceholderImage.avatar(),
                ),
              ),
            ),
          final BeaconNode node => Container(
              width: node.size,
              height: node.size,
              foregroundDecoration: _decorationBeacon,
              child: FutureImage(
                futureImage: node.futureImage,
                placeholder: const PlaceholderImage.beacon(),
              ),
            ),
        },
      );
}
