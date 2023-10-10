import 'package:flutter/foundation.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/features/graph/domain/entity/node_details.dart';
import 'package:gravity/features/graph/data/_g/graph_fetch_for_ego.data.gql.dart';
import 'package:gravity/features/graph/data/_g/graph_fetch_for_ego.req.gql.dart';
import 'package:gravity/ui/ferry_utils.dart';

import 'widget/graph_node_widget.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  static const _requestId = 'FetchGraph';

  final _controller =
      GraphController<Node<NodeDetails>, EdgeBase<Node<NodeDetails>>>();

  late final _ego = GoRouterState.of(context).uri.queryParameters['ego'] ?? '';

  Node<NodeDetails>? _egoNode;

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
              onPressed: () async => GetIt.I<Client>().requestController.add(
                    GGraphFetchForEgoReq((b) => b
                      ..fetchPolicy = FetchPolicy.NetworkOnly
                      ..requestId = _requestId + _ego
                      ..vars.ego = _ego),
                  ),
              child: const Text('Refresh'),
            ),
            TextButton(
              onPressed: _reset,
              child: const Text('Center'),
            ),
          ],
        ),
        body: Operation(
          client: GetIt.I<Client>(),
          operationRequest: GGraphFetchForEgoReq(
            (b) => b
              ..requestId = _requestId + _ego
              ..vars.ego = _ego,
          ),
          builder: (context, response, error) =>
              showLoaderOrErrorOr(response, error) ??
              Builder(
                builder: (context) {
                  _prepareGraph(response!.data!.gravityGraph);
                  return GraphView<Node<NodeDetails>,
                      EdgeBase<Node<NodeDetails>>>(
                    controller: _controller,
                    canvasSize: const GraphCanvasSize.fixed(Size.square(5000)),
                    layoutAlgorithm: const FruchtermanReingoldAlgorithm(
                      iterations: 50,
                      showIterations: true,
                    ),
                    edgePainter: const CustomEdgePainter(),
                    loaderBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    labelBuilder: BottomLabelBuilder(
                      labelSize: const Size(100, 20),
                      builder: (context, node) => switch (node) {
                        final Node<UserNode> n => Text(n.data.label),
                        final Node<BeaconNode> n => Text(n.data.label),
                        final Node<CommentNode> n => Text(n.data.id),
                        _ => const Offstage(),
                      },
                    ),
                    nodeBuilder: (context, node) => GraphNodeWidget(
                      nodeDetails: node.data,
                      size: node.size,
                      // onTap: () => _controller.jumpToNode(node),
                    ),
                  );
                },
              ),
        ),
      );

  void _reset() {
    if (_egoNode != null) _controller.jumpToNode(_egoNode!);
  }

  void _prepareGraph(GGraphFetchForEgoData_gravityGraph graph) {
    if (_ego.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('No data or got error'),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
      ));
      return;
    }
    _egoNode = Node<NodeDetails>(
      data: _buildNodeDetails(graph, _ego),
      pinned: true,
      size: 80,
    );
    _controller.mutate((mutator) {
      if (kDebugMode) print('Fetched edges: ${graph.edges.length}');
      if (kDebugMode) print('Has nodes: ${mutator.controller.nodes.length}');
      if (!mutator.controller.nodes.contains(_egoNode)) {
        mutator.addNode(_egoNode!);
      }
      for (final e in graph.edges) {
        if (e == null) continue;
        final src = Node(data: _buildNodeDetails(graph, e.src), size: 40);
        final dst = Node(data: _buildNodeDetails(graph, e.dest), size: 40);
        final edge = Edge.simple(src, dst);
        if (!mutator.controller.nodes.contains(src)) mutator.addNode(src);
        if (!mutator.controller.nodes.contains(dst)) mutator.addNode(dst);
        if (!mutator.controller.edges.contains(edge)) mutator.addEdge(edge);
      }
      if (kDebugMode) {
        print('Nodes: ${mutator.controller.nodes.length}'
            ', Edges: ${mutator.controller.edges.length}');
      }
    });
    Future.delayed(const Duration(milliseconds: 250), _reset);
  }

  NodeDetails _buildNodeDetails(
    GGraphFetchForEgoData_gravityGraph graph,
    String node,
  ) =>
      switch (switch (_ego.substring(0, 1)) {
        'U' => graph.users.firstWhere((e) => e?.user?.id == _ego),
        'B' => graph.beacons.firstWhere((e) => e?.beacon?.id == _ego),
        'C' => graph.comments.firstWhere((e) => e?.node == _ego),
        _ => throw Exception('Wrong id type'),
      }) {
        final GGraphFetchForEgoData_gravityGraph_users n => UserNode(
            id: n.user?.id,
            label: n.user?.title,
            hasImage: n.user?.has_picture,
            score: n.score,
          ),
        final GGraphFetchForEgoData_gravityGraph_beacons n => BeaconNode(
            id: n.beacon?.id,
            userId: n.beacon?.user_id,
            hasImage: n.beacon?.has_picture,
            label: n.beacon?.title,
            score: n.score,
          ),
        final GGraphFetchForEgoData_gravityGraph_comments n => CommentNode(
            id: n.node,
            score: n.score,
          ),
        _ => throw Exception('Wrong fetched data type'),
      };
}

class CustomEdgePainter
    implements EdgePainter<Node<NodeDetails>, Edge<Node<NodeDetails>>> {
  const CustomEdgePainter();

  @override
  void paint(
    Canvas canvas,
    Edge<NodeBase> edge,
    Offset sourcePosition,
    Offset destinationPosition,
  ) {
    canvas.drawLine(
      sourcePosition,
      destinationPosition,
      Paint()
        ..color = Colors.amber
        ..strokeWidth = 2,
    );
  }
}
