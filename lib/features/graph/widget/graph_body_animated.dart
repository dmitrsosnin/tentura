import 'package:flutter/material.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:tentura/app/router.dart';
import 'package:tentura/features/graph/bloc/graph_cubit.dart';
import 'package:tentura/domain/entity/edge_details.dart';
import 'package:tentura/domain/entity/node_details.dart';
import 'package:tentura/ui/utils/state_base.dart';

import 'animated_edge_painter.dart';
import 'graph_node_widget.dart';

class GraphBody extends StatefulWidget {
  const GraphBody({super.key});

  @override
  AnimatedGraphBodyState createState() => AnimatedGraphBodyState();
}

class AnimatedGraphBodyState extends State<GraphBody>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  )..repeat();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<GraphCubit, GraphState>(
        buildWhen: (p, c) =>
            p.status != c.status || p.positiveOnly != c.positiveOnly,
        builder: (context, state) => switch (state.status) {
          FetchStatus.isEmpty || FetchStatus.isLoading => Container(),
          _ => GraphView<NodeDetails, EdgeDetails<NodeDetails>>(
              controller: context.read<GraphCubit>().graphController,
              maxScale: 3,
              minScale: 0.1,
              canvasSize: const GraphCanvasSize.fixed(Size(4096, 4096)),
              layoutAlgorithm: const FruchtermanReingoldAlgorithm(
                iterations: 1500,
                temperature: 500,
                optimalDistance: 100,
                showIterations: true,
              ),
              edgePainter: AnimatedHighlightedEdgePainter(
                animation: _animationController,
              ),
              labelBuilder: BottomLabelBuilder(
                labelSize: const Size(100, 20),
                builder: (context, node) => switch (node) {
                  final UserNode node => Text(
                      node.label,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                  final BeaconNode node => Text(
                      node.label,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  _ => const Offstage(),
                },
              ),
              nodeBuilder: (context, node) => GraphNodeWidget(
                nodeDetails: node,
                onTap: () => context.read<GraphCubit>().setFocus(node),
                onDoubleTap: () => context.push(switch (node) {
                  final UserNode node => Uri(
                      path: pathProfileView,
                      queryParameters: {
                        'id': node.id,
                      },
                    ),
                  final BeaconNode node => Uri(
                      path: pathBeaconView,
                      queryParameters: {
                        'id': node.id,
                        'expanded': 'false',
                      },
                    ),
                  final CommentNode node => Uri(
                      path: pathBeaconView,
                      queryParameters: {
                        'id': node.beaconId,
                        'expanded': 'true',
                      },
                    ),
                }
                    .toString()),
              ),
            ),
        },
        listenWhen: (p, c) => c.hasError,
        listener: (context, state) {
          final error = state.error ?? 'Undescribed error';
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(error.toString()),
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
          ));
        },
      );
}
