import 'package:flutter/material.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/domain/entity/graph_node.dart';

import 'widget/graph_node_widget.dart';

class GraphScreen extends StatefulWidget {
  final GraphNode rootNode;
  final List<GraphNode> nodes;

  const GraphScreen({
    required this.rootNode,
    required this.nodes,
    super.key,
  });

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  final _controller = GraphController<Node<GraphNode>, Edge<Node<GraphNode>>>();

  @override
  void initState() {
    super.initState();
    _controller.mutate((mutator) {
      final rootNode = Node(data: widget.rootNode, size: 80);
      mutator.addNode(rootNode);
      for (final n in widget.nodes) {
        final node = Node(data: n, size: 40);
        mutator
          ..addNode(node)
          ..addEdge(Edge(
            source: rootNode,
            destination: node,
          ));
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
        body: GraphView<Node<GraphNode>, Edge<Node<GraphNode>>>(
          controller: _controller,
          canvasSize: const GraphCanvasSize.proportional(20),
          layoutAlgorithm: const FruchtermanReingoldAlgorithm(),
          nodeBuilder: (context, node) => GraphNodeWidget(
            node: node,
            onTap: () => _controller.jumpToNode(node),
          ),
          labelBuilder: BottomLabelBuilder(
            builder: (context, node) => Text(node.data.title),
            labelSize: const Size(100, 20),
          ),
        ),
      );
}
