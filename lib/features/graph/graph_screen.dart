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

  final _controller = GraphController<NodeDetails, EdgeBase<NodeDetails>>();

  late final _ego = GoRouterState.of(context).uri.queryParameters['ego'] ?? '';

  NodeDetails? _egoNode;

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
              onPressed: () => _controller.jumpToNode(_egoNode!),
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
                  return GraphView<NodeDetails, EdgeBase<NodeDetails>>(
                    controller: _controller,
                    canvasSize: const GraphCanvasSize.fixed(Size.square(5000)),
                    layoutAlgorithm: const FruchtermanReingoldAlgorithm(),
                    edgePainter:
                        const LineEdgePainter(color: Colors.amberAccent),
                    loaderBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    labelBuilder: BottomLabelBuilder(
                      labelSize: const Size(100, 20),
                      builder: (context, node) => Text(
                        node.label,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    nodeBuilder: (context, node) => GraphNodeWidget(
                      nodeDetails: node,
                      onTap: () => _controller.jumpToNode(node),
                    ),
                  );
                },
              ),
        ),
      );

  void _prepareGraph(GGraphFetchForEgoData_gravityGraph graph) {
    if (_ego.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('No data or got error'),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
      ));
      return;
    }
    _egoNode = _buildNodeDetails(
      graph: graph,
      node: _ego,
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
        final src = _buildNodeDetails(graph: graph, node: e.src);
        final dst = _buildNodeDetails(graph: graph, node: e.dest);
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
    Future.delayed(
      const Duration(milliseconds: 250),
      () => _controller.jumpToNode(_egoNode!),
    );
  }

  NodeDetails _buildNodeDetails({
    required GGraphFetchForEgoData_gravityGraph graph,
    required String node,
    double size = 40,
    bool pinned = false,
  }) =>
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
            pinned: pinned,
            size: size,
          ),
        final GGraphFetchForEgoData_gravityGraph_beacons n => BeaconNode(
            id: n.beacon?.id,
            userId: n.beacon?.user_id,
            hasImage: n.beacon?.has_picture,
            label: n.beacon?.title,
            pinned: pinned,
            size: size,
          ),
        final GGraphFetchForEgoData_gravityGraph_comments n => CommentNode(
            id: n.node,
            pinned: pinned,
            size: size,
          ),
        _ => throw Exception('Wrong fetched data type'),
      };
}
