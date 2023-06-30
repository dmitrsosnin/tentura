import 'dart:math';
import 'package:flutter/material.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/user/entity/user.dart';
import 'package:gravity/graph/entity/graph_node.dart';

import 'widget/graph_node_widget.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  final _controller = GraphController();
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _controller.mutate((mutator) {
      const nodeCount = 50;

      for (var i = 0; i < nodeCount; i++) {
        final node = Node(
          data: User(id: _random.nextInt(1024).toString()),
          size: i + 20,
        );
        mutator.addNode(node);

        for (final other in _controller.nodes) {
          if (other != node &&
              _random.nextInt(nodeCount + 40 - node.size.toInt()) == 0) {
            mutator.addEdge(Edge(node, other));
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Graph view'),
          actions: [
            TextButton(
              onPressed: () => _controller.zoomBy(1),
              child: const Text('Reset'),
            ),
          ],
        ),
        backgroundColor: Colors.black12,
        body: GraphView(
          controller: _controller,
          maxScale: 5,
          minScale: 0.1,
          size: const Size.square(1000),
          layoutAlgorithm: const FruchtermanReingoldAlgorithm(
            iterations: 500,
          ),
          nodeBuilder: (context, node) => GraphNodeWidget(
            node: UserNode(
              isActive: false,
              size: node.size,
              user: User(title: node.hashCode.toString()),
            ),
            onTap: () => _controller.jumpToNode(node),
          ),
          edgePainter: (canvas, edge, sourcePosition, targetPosition) {
            canvas.drawLine(
              sourcePosition,
              targetPosition,
              Paint()
                ..strokeWidth = edge.source.size / edge.target.size
                ..color = Colors.black54,
            );
          },
          labelBuilder: (context, node) {
            if (node.size < 50) return null;
            final user = node.data as User;
            return LabelConfiguration(
              size: Size.square(node.size * 2),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    user.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: node.size / 5,
                    ),
                  ),
                ),
              ),
            );
          },
          loadingBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
}
