import 'package:flutter/material.dart';

class HeaderGradient extends StatelessWidget {
  const HeaderGradient({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 300,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: 100,
          )),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF9A396),
              Color(0xFFC52AEE),
              Color(0xFF8829CD),
              Color(0xFF24F6FE),
              Color(0xFF24F6FE),
            ],
            stops: [
              0.1,
              0.3,
              0.5,
              0.7,
              0.8,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.mirror,
            transform: GradientRotation(0.3),
          ),
        ),
      );
}
