import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/data/gql/comment/_g/_fragments.data.gql.dart';
import 'package:gravity/features/graph/data/_g/graph_fetch_for_ego.req.gql.dart';
import 'package:gravity/ui/ferry_utils.dart';

import 'widget/graph_node_widget.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  final _controller = GraphController<Node<Object>, Edge<Node<Object>>>();

  late final _ego = GoRouterState.of(context).uri.queryParameters['ego'];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1), _prepareGraph);
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
        body: _isLoading
            ? const CircularProgressIndicator.adaptive()
            : GraphView<Node<Object>, Edge<Node<Object>>>(
                controller: _controller,
                canvasSize: const GraphCanvasSize.proportional(20),
                layoutAlgorithm: const FruchtermanReingoldAlgorithm(),
                nodeBuilder: (context, node) => GraphNodeWidget(
                  node: node,
                  onTap: () => _controller.jumpToNode(node),
                ),
                labelBuilder: BottomLabelBuilder(
                  labelSize: const Size(100, 20),
                  builder: (context, node) => switch (node) {
                    final Node<GUserFields> node => Text(node.data.title),
                    final Node<GBeaconFields> node => Text(node.data.title),
                    final Node<GCommentFields> node => Text(node.data.id),
                    _ => const Offstage(),
                  },
                ),
              ),
      );

  Future<void> _prepareGraph() async {
    final response = await GetIt.I<Client>()
        .request(GGraphFetchForEgoReq((b) => b.vars.ego = _ego))
        .firstWhere((e) => e.data != null);

    final rootNode = Node<GUserFieldsData>(
      data: GUserFieldsData(
        (b) => b
          ..id = _ego
          ..title = 'Me'
          ..description = ''
          ..has_picture = false,
      ),
      size: 80,
    );

    final nodes = <Node<Object>>[];

    _controller.mutate((mutator) {
      mutator.addNode(rootNode);
      for (final n in nodes) {
        mutator.addEdge(Edge(
          source: rootNode,
          destination: Node(data: n, size: 40),
        ));
      }
    });
    // _controller.jumpToNode(rootNode);
    setState(() => _isLoading = false);
  }
}
