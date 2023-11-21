import 'dart:math';

import 'package:flutter/material.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';


/// An animation easing function that adapts linear animation to human perception.
///
/// This function is based on the work of Maverick Reynolds, "A New Family of Easing Functions".
/// The function idea is derived from slightly modifying the logistic equation
/// to "ramp up" at the end: dR/dt = kR(1-R) / t(1-t)
///
/// The `easeInOutReynolds` function takes in three parameters:
/// * [t] which is the current value of the animation. It should be a value between 0 and 1.
/// * [c] which is used to skew the speed-up towards the start or the end. If it's less than 1,
/// speed-up is towards the start, if it's more than 1, speed-up is towards the end.
/// * [k] which is the degree of speeding-up in the middle (non-linearity).
double easeInOutReynolds(double t, {double c = 1, double k = 2}) {
  return 1 / (1 + c * pow(1 / t - 1, k));
}

@immutable
class AnimatedHighlightedEdgePainter<N extends NodeBase, E extends EdgeBase<N>>
    implements AnimatedEdgePainter<N, E> {
  const AnimatedHighlightedEdgePainter({
    required this.animation,
    this.thickness = 4.0,
    this.color = Colors.grey,
    this.highlightColor = Colors.black,
    this.highlightWidthFactor = 0.3,
  });

  final double thickness;
  final Color color;
  final Color highlightColor;
  final double highlightWidthFactor;
  @override
  final Animation<double> animation;

  @override
  void paint(
    Canvas canvas,
    E edge,
    Offset sourcePosition,
    Offset destinationPosition,
  ) {
    final paint = Paint()
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      ..shader = _createGradientShader(sourcePosition, destinationPosition);

    canvas.drawLine(sourcePosition, destinationPosition, paint);
  }

  Shader _createGradientShader(
    Offset src,
    Offset dst,
  ) {
    final hr = highlightWidthFactor / 2; // Highlight radius
    final highlightCenter =
        easeInOutReynolds(animation.value) * (1.0 + hr * 2) - hr;
    final highlightStart = highlightCenter - hr;
    final highlightEnd = highlightCenter + hr;

    // Determine the bounding box
    final minX = min(src.dx, dst.dx);
    final maxX = max(src.dx, dst.dx);
    final minY = min(src.dy, dst.dy);
    final maxY = max(src.dy, dst.dy);

    final minPoint = Offset(minX, minY);
    final maxPoint = Offset(maxX, maxY);

    // Convert to Alignment, considering that Alignment(0,0) is the center of the canvas
    final start = _normalizeAndConvertToAlignment(src, minPoint, maxPoint);
    final end = _normalizeAndConvertToAlignment(dst, minPoint, maxPoint);

    return LinearGradient(
      begin: start,
      end: end,
      colors: [color, highlightColor, color],
      stops: [
        highlightStart.clamp(0.0, 1.0),
        highlightCenter.clamp(0.0, 1.0),
        highlightEnd.clamp(0.0, 1.0),
      ],
    ).createShader(Rect.fromPoints(src, dst));
  }

  Alignment _normalizeAndConvertToAlignment(
    Offset point,
    Offset minPoint,
    Offset maxPoint,
  ) {
    final normalizedX =
        2 * ((point.dx - minPoint.dx) / (maxPoint.dx - minPoint.dx)) - 1;
    final normalizedY =
        2 * ((point.dy - minPoint.dy) / (maxPoint.dy - minPoint.dy)) - 1;
    return Alignment(normalizedX, normalizedY);
  }
}
