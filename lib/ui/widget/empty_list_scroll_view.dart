import 'package:flutter/material.dart';

class EmptyListScrollView extends StatelessWidget {
  const EmptyListScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Container(
              alignment: Alignment.center,
              child: const Text('Nothing here yet'),
            ),
          ),
        ],
      );
}
