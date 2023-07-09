import 'dart:math';
import 'package:flutter/material.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/entity/user.dart';
import 'package:gravity/entity/beacon.dart';
import 'package:gravity/entity/graph_node.dart';

import 'widget/graph_node_widget.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  final _controller = GraphController();
  final _random = Random();
  final _beacon = Beacon(
    id: '',
    author: const User(),
    title: '',
    description: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  void initState() {
    super.initState();
    _controller.mutate((mutator) {
      const nodeCount = 50;

      for (var i = 0; i < nodeCount; i++) {
        final node = _random.nextBool()
            ? UserNode(
                user: User(id: _random.nextInt(1024).toString()),
                size: i + 20,
              )
            : BeaconNode(
                beacon: _beacon,
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
          maxScale: 3,
          minScale: 0.3,
          size: const Size.square(3000),
          layoutAlgorithm: const FruchtermanReingoldAlgorithm(
            iterations: 500,
          ),
          nodeBuilder: (context, node) => GraphNodeWidget(
            node: node as GraphNode,
            onTap: () => _controller.jumpToNode(node),
          ),
          labelBuilder: (context, node) => switch (node) {
            final UserNode node => LabelConfiguration(
                size: Size.square(node.size),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    node.user.title.isEmpty
                        ? 'Unnamed person'
                        : node.user.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: node.size / 5),
                  ),
                ),
              ),
            _ => null,
          },
          edgePainter: (canvas, edge, sourcePosition, targetPosition) {
            canvas.drawLine(
              sourcePosition,
              targetPosition,
              Paint()
                ..strokeWidth = edge.source.size / edge.target.size
                ..color = Colors.black54,
            );
          },
          loadingBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
}
