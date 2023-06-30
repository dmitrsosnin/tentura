import 'package:flutter/material.dart';

import 'package:gravity/graph/entity/graph_node.dart';

class GraphNodeWidget extends StatelessWidget {
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
        child: SizedBox(
          width: node.size,
          height: node.size,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              border: Border.all(
                color: node.isActive ? Colors.red : Colors.black,
                width: 2,
              ),
            ),
            child: Text(
              (node as UserNode).user.title,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      );
}
