import 'package:flutter/material.dart';

import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/utils/ui_consts.dart';

class RatingListTile extends StatelessWidget {
  RatingListTile({
    required this.myAvatar,
    required this.user,
    required this.egoScore,
    required this.userScore,
    this.height = 40,
    super.key,
  });

  final Widget myAvatar;
  final double height;
  final double egoScore;
  final double userScore;
  final GUserFields user;

  late final _barbellSize = Size(height * 2.5, height);

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
    final maxRadius = halfHeight - quarterHeight;
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
