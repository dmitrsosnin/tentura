import 'package:flutter/material.dart';

class AvatarPositioned extends StatelessWidget {
  static const childSize = 200.0;

  final Widget child;

  const AvatarPositioned({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Positioned(
        top: 100,
        left: 50,
        child: Container(
          width: childSize,
          height: childSize,
          decoration: BoxDecoration(
            border: Border.all(
              width: 8,
              color: Theme.of(context).colorScheme.background,
            ),
            shape: BoxShape.circle,
          ),
          child: child,
        ),
      );
}
