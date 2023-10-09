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
  final _controller =
      GraphController<Node<NodeDetails>, Edge<Node<NodeDetails>>>();

  late final _ego = GoRouterState.of(context).uri.queryParameters['ego'] ?? '';

  late final Node<NodeDetails> rootNode;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), _prepareGraph);
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
              onPressed: () => _controller
                ..zoomBy(1)
                ..jumpToNode(rootNode),
              child: const Text('Reset'),
            ),
          ],
        ),
        body: _isLoading
            ? const CircularProgressIndicator.adaptive()
            : GraphView<Node<NodeDetails>, Edge<Node<NodeDetails>>>(
                controller: _controller,
                canvasSize: const GraphCanvasSize.proportional(50),
                layoutAlgorithm: const FruchtermanReingoldAlgorithm(),
                nodeBuilder: (context, node) => GraphNodeWidget(
                  nodeDetails: node.data,
                  // onTap: () => _controller.jumpToNode(node),
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
              ),
      );

  Future<void> _prepareGraph() async {
    final response = await GetIt.I<Client>()
        .request(GGraphFetchForEgoReq((b) => b.vars.ego = _ego))
        .firstWhere((e) => e.dataSource != DataSource.Optimistic);

    final gravityGraph = response.data?.gravityGraph;

    if (_ego.isEmpty || gravityGraph == null || response.hasErrors) {
      setState(() => _isLoading = false);
      // TBD: show error
      return;
    }

    rootNode = Node<NodeDetails>(
      data: _buildNode(gravityGraph, _ego),
      size: 80,
    );
    _controller
      ..mutate((mutator) {
        mutator.addNode(rootNode);
        for (final edge in gravityGraph.edges) {
          if (edge == null) continue;
          final src = Node(data: _buildNode(gravityGraph, edge.src), size: 40);
          final dst = Node(data: _buildNode(gravityGraph, edge.dest), size: 40);
          if (!_controller.nodes.contains(src)) mutator.addNode(src);
          if (!_controller.nodes.contains(dst)) mutator.addNode(dst);
          mutator.addEdge(Edge.simple(src, dst));
        }
      })
      ..jumpToNode(rootNode);

    setState(() => _isLoading = false);
  }

  NodeDetails _buildNode(
    GGraphFetchForEgoData_gravityGraph gravityGraph,
    String node,
  ) =>
      switch (switch (_ego.substring(0, 1)) {
        'U' => gravityGraph.users.firstWhere((e) => e?.user?.id == _ego),
        'B' => gravityGraph.beacons.firstWhere((e) => e?.beacon?.id == _ego),
        'C' => gravityGraph.comments.firstWhere((e) => e?.node == _ego),
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
