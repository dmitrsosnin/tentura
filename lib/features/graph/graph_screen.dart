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
              onPressed: () => _controller.jumpToNode(_egoNode!),
              child: const Text('Center'),
            ),
          ],
        ),
        body: Operation(
          client: GetIt.I<Client>(),
          operationRequest: GGraphFetchForEgoReq(
            (b) => b
              ..fetchPolicy = FetchPolicy.NetworkOnly
              ..vars.ego = _ego,
          ),
          builder: (context, response, error) =>
              showLoaderOrErrorOr(response, error) ??
              Builder(
                builder: (context) {
                  _updateGraph(response!.data!.gravityGraph);
                  return GraphView<NodeDetails, EdgeBase<NodeDetails>>(
                    controller: _controller,
                    minScale: 0.2,
                    maxScale: 3,
                    canvasSize: const GraphCanvasSize.proportional(200),
                    layoutAlgorithm: const FruchtermanReingoldAlgorithm(
                      iterations: 200,
                      showIterations: true,
                    ),
                    edgePainter: const _CustomEdgePainter(),
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
                      onTap: () async {
                        _controller.jumpToNode(node);
                        final focusResult = await GetIt.I<Client>()
                            .request(GGraphFetchForEgoReq(
                              (b) => b
                                ..fetchPolicy = FetchPolicy.NetworkOnly
                                ..vars.ego = _ego
                                ..vars.focus = node.id,
                            ))
                            .firstWhere((e) => e.dataSource == DataSource.Link);
                        if (focusResult.data?.gravityGraph != null) {
                          _updateGraph(focusResult.data!.gravityGraph);
                        }
                      },
                    ),
                  );
                },
              ),
        ),
      );

  void _updateGraph(GGraphFetchForEgoData_gravityGraph graph) {
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
      if (!mutator.controller.nodes.contains(_egoNode)) {
        mutator.addNode(_egoNode!);
      }
      for (final e in graph.edges) {
        if (e == null) continue;
        final src = _buildNodeDetails(graph: graph, node: e.src);
        final dst = _buildNodeDetails(graph: graph, node: e.dest);
        final edge = Edge(
          source: src,
          destination: dst,
          data: e.weight < 0
              ? Colors.redAccent
              : (src == _egoNode || dst == _egoNode)
                  ? Colors.amberAccent
                  : Colors.cyanAccent,
        );
        if (!mutator.controller.nodes.contains(src)) mutator.addNode(src);
        if (!mutator.controller.nodes.contains(dst)) mutator.addNode(dst);
        if (!mutator.controller.edges.contains(edge)) mutator.addEdge(edge);
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
      switch (switch (node.substring(0, 1)) {
        'U' => graph.users.firstWhere((e) => e?.user?.id == node),
        'B' => graph.beacons.firstWhere((e) => e?.beacon?.id == node),
        'C' => graph.comments.firstWhere((e) => e?.node == node),
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
            size: size / 2,
          ),
        _ => throw Exception('Wrong fetched data type'),
      };
}

class _CustomEdgePainter
    implements EdgePainter<NodeDetails, Edge<NodeDetails>> {
  const _CustomEdgePainter();

  @override
  void paint(
    Canvas canvas,
    Edge edge,
    Offset sourcePosition,
    Offset destinationPosition,
  ) {
    canvas.drawLine(
      sourcePosition,
      destinationPosition,
      Paint()
        ..color = (edge.data as Color?) ?? Colors.amberAccent
        ..strokeWidth = 2,
    );
  }
}
