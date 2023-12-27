import 'dart:math';
import 'package:flutter/material.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:tentura/app/router.dart';

import 'package:tentura/features/graph/domain/entity/edge_details.dart';
import 'package:tentura/features/graph/domain/entity/node_details.dart';
import 'package:tentura/features/graph/widget/graph_node_widget.dart';
import 'package:tentura/features/graph/bloc/graph_cubit.dart';

class GraphBody extends StatefulWidget {
  const GraphBody({
    required this.controller,
    this.isLabeled = true,
    this.isAnimated = true,
    this.labelSize = const Size(100, 20),
    this.scaleRange = const Offset(0.1, 3),
    this.animationDuration = const Duration(seconds: 2),
    this.canvasSize = const GraphCanvasSize.fixed(Size(4096, 4096)),
    this.layoutAlgorithm = const FruchtermanReingoldAlgorithm(
      iterations: 1500,
      temperature: 500,
      optimalDistance: 100,
      showIterations: true,
    ),
    super.key,
  });

  final Size labelSize;
  final bool isLabeled;
  final bool isAnimated;
  final Offset scaleRange;
  final Duration animationDuration;
  final GraphCanvasSize canvasSize;
  final GraphLayoutAlgorithm layoutAlgorithm;
  final GraphController<NodeDetails, EdgeDetails<NodeDetails>> controller;

  @override
  GraphBodyState createState() => GraphBodyState();
}

class GraphBodyState extends State<GraphBody>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    duration: widget.animationDuration,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    if (widget.isAnimated) _animationController.repeat();
  }

  @override
  void dispose() {
    if (widget.isAnimated) _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      GraphView<NodeDetails, EdgeDetails<NodeDetails>>(
        controller: context.read<GraphCubit>().graphController,
        canvasSize: widget.canvasSize,
        minScale: widget.scaleRange.dx,
        maxScale: widget.scaleRange.dy,
        layoutAlgorithm: widget.layoutAlgorithm,
        edgePainter: _AnimatedHighlightedEdgePainter(
          animation: _animationController,
          highlightColor: Theme.of(context).canvasColor,
          highlightRadius: 0.15,
          isAnimated: widget.isAnimated,
        ),
        labelBuilder: widget.isLabeled
            ? BottomLabelBuilder(
                labelSize: widget.labelSize,
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
              )
            : null,
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
      );
}

class _AnimatedHighlightedEdgePainter
    implements AnimatedEdgePainter<NodeDetails, EdgeDetails<NodeDetails>> {
  const _AnimatedHighlightedEdgePainter({
    required this.animation,
    required this.highlightColor,
    required this.highlightRadius,
    this.isAnimated = true,
  });

  @override
  final Animation<double> animation;

  final bool isAnimated;
  final Color highlightColor;
  final double highlightRadius;

  @override
  void paint(
    Canvas canvas,
    EdgeDetails<NodeDetails> edge,
    Offset src,
    Offset dst,
  ) {
    if (!isAnimated) {
      return canvas.drawLine(
        src,
        dst,
        Paint()
          ..color = edge.color
          ..strokeWidth = edge.strokeWidth,
      );
    }
    // Replacement for speed up calculateInOutReynolds() calculation with defaults
    final highlightCenter = (1 / (pow(1 / animation.value - 1, 2) + 1)) *
            (1 + highlightRadius * 2) -
        highlightRadius;
    final minPoint = Offset(min(src.dx, dst.dx), min(src.dy, dst.dy));
    final maxPoint = Offset(max(src.dx, dst.dx), max(src.dy, dst.dy));
    canvas.drawLine(
      src,
      dst,
      Paint()
        ..strokeWidth = edge.strokeWidth
        ..style = PaintingStyle.stroke
        ..shader = LinearGradient(
          begin: _getNormalizedAlignment(src, minPoint, maxPoint),
          end: _getNormalizedAlignment(dst, minPoint, maxPoint),
          colors: [edge.color, highlightColor, edge.color],
          stops: [
            (highlightCenter - highlightRadius).clamp(0, 1),
            highlightCenter.clamp(0, 1),
            (highlightCenter + highlightRadius).clamp(0, 1),
          ],
        ).createShader(Rect.fromPoints(src, dst)),
    );
  }

  /// Normalize and convert to Alignment
  /// Considering that Alignment(0,0) is the center of the canvas
  Alignment _getNormalizedAlignment(
    Offset point,
    Offset minPoint,
    Offset maxPoint,
  ) =>
      Alignment(
        2 * ((point.dx - minPoint.dx) / (maxPoint.dx - minPoint.dx)) - 1,
        2 * ((point.dy - minPoint.dy) / (maxPoint.dy - minPoint.dy)) - 1,
      );
}

/// An animation easing function that adapts linear animation to human perception.
///
/// This function is based on the work of Maverick Reynolds, "A New Family of Easing Functions".
/// The function idea is derived from slightly modifying the logistic equation
/// to "ramp up" at the end: dR/dt = kR(1-R) / t(1-t)
///
/// The `calculateInOutReynolds` function takes in three parameters:
/// * [value] which is the current value of the animation. It should be a value between 0 and 1.
/// * [skewFactor] which is used to skew the speed-up towards the start or the end. If it's less than 1,
/// speed-up is towards the start, if it's more than 1, speed-up is towards the end.
/// * [velocity] which is the degree of speeding-up in the middle (non-linearity).
double calculateInOutReynolds(
  double value, [
  double skewFactor = 1,
  double velocity = 2,
]) =>
    1 / (1 + skewFactor * pow(1 / value - 1, velocity));
