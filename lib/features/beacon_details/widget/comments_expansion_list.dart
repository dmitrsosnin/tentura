import 'package:flutter/material.dart';

import 'package:gravity/entity/beacon.dart';

class CommentsExpansionList extends StatelessWidget {
  final Beacon beacon;

  const CommentsExpansionList({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ExpansionTile(
        title: Text('${beacon.commentsCount} comments'),
        children: const [
          Text('Some comment'),
          Text('Another comment'),
        ],
      );
}
