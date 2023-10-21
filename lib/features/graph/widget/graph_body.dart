import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/data/utils.dart';
import 'package:gravity/features/graph/bloc/graph_cubit.dart';
import 'package:gravity/features/graph/entity/edge_details.dart';
import 'package:gravity/features/graph/entity/node_details.dart';
import 'package:gravity/ui/widget/error_center_text.dart';
import 'package:gravity/ui/ferry_utils.dart';

import 'graph_node_widget.dart';

class GraphBody extends StatelessWidget {
  const GraphBody({super.key});

  @override
  Widget build(BuildContext context) => BlocConsumer<GraphCubit, GraphState>(
        buildWhen: (p, c) => p.status != c.status,
        builder: (context, state) => switch (state.status) {
          FetchStatus.isEmpty => Container(),
          FetchStatus.isLoading => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          FetchStatus.hasError => ErrorCenterText(error: state.error),
          FetchStatus.hasData =>
            GraphView<NodeDetails, EdgeDetails<NodeDetails>>(
              controller: context.read<GraphCubit>().graphController,
              minScale: 0.1,
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
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
              ),
              nodeBuilder: (context, node) => GraphNodeWidget(
                nodeDetails: node,
                onTap: () => context.read<GraphCubit>().setFocus(node),
              ),
            ),
        },
        listenWhen: (p, c) => c.status == FetchStatus.hasError,
        listener: (context, state) {
          final error = state.error ?? 'Undescribed error';
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(error.toString()),
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
          ));
        },
      );
}

class _CustomEdgePainter
    implements EdgePainter<NodeDetails, EdgeDetails<NodeDetails>> {
  const _CustomEdgePainter();

  @override
  void paint(
    Canvas canvas,
    EdgeDetails edge,
    Offset sourcePosition,
    Offset destinationPosition,
  ) {
    canvas.drawLine(
      sourcePosition,
      destinationPosition,
      Paint()
        ..color = edge.color
        ..strokeWidth = edge.strokeWidth,
    );
  }
}
