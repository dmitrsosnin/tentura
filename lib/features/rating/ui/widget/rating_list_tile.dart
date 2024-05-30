import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_consts.dart';

import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/features/image/ui/widget/avatar_image.dart';

class RatingListTile extends StatelessWidget {
  RatingListTile({
    required this.user,
    required this.egoScore,
    required this.userScore,
    this.height = 40,
    this.ratio = 2.5,
    this.myAvatar,
    super.key,
  });

  final Widget? myAvatar;
  final double ratio;
  final double height;
  final double egoScore;
  final double userScore;
  final User user;

  late final _barbellSize = Size(height * ratio, height);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Padding(
            padding: paddingAll8,
            child: AvatarImage(userId: user.imageId, size: height),
          ),
          Padding(
            padding: paddingAll8,
            child: Text(user.title),
          ),
          const Spacer(),
          Padding(
            padding: paddingAll8,
            child: CustomPaint(
              size: _barbellSize,
              painter: _CustomBarbellPainter(userScore, egoScore),
            ),
          ),
          if (myAvatar != null)
            Padding(
              padding: paddingAll8,
              child: myAvatar,
            ),
        ],
      );
}

class _CustomBarbellPainter extends CustomPainter {
  const _CustomBarbellPainter(this.leftWeight, this.rightWeight);

  final double leftWeight;
  final double rightWeight;

  @override
  void paint(Canvas canvas, Size size) {
    final halfHeight = size.height / 2;
    final quarterHeight = halfHeight / 2;
    final leftOffset = Offset(halfHeight, halfHeight);
    final rightOffset = Offset(size.width - halfHeight, halfHeight);
    // final maxRadius = halfHeight - quarterHeight;
    final maxRadius = halfHeight;
    final minRadius = quarterHeight / 2;
    final leftColor = _calcColor(leftWeight);
    final rightColor = _calcColor(rightWeight);
    canvas
      ..drawLine(
        leftOffset,
        rightOffset,
        Paint()
          ..strokeWidth = quarterHeight / 2
          ..shader = LinearGradient(
            colors: [leftColor, rightColor],
          ).createShader(Rect.fromPoints(leftOffset, rightOffset)),
      )
      ..drawCircle(
        leftOffset,
        _calcRadius(minRadius, maxRadius, leftWeight),
        Paint()..color = leftColor,
      )
      ..drawCircle(
        rightOffset,
        _calcRadius(minRadius, maxRadius, rightWeight),
        Paint()..color = rightColor,
      );
  }

  @override
  bool shouldRepaint(_CustomBarbellPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CustomBarbellPainter oldDelegate) => false;

  // TBD: normalization
  double _calcRadius(
    double minRadius,
    double maxRadius,
    double weight,
  ) =>
      weight < 0.01
          ? minRadius
          : weight < 0.1
              ? minRadius + (maxRadius - minRadius) / 2
              : maxRadius;

  // TBD: normalization
  Color _calcColor(double weight) => weight < 0.01
      ? Colors.amber[100]!
      : weight < 0.1
          ? Colors.amber[500]!
          : Colors.amber[900]!;
}
