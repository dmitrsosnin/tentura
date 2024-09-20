import 'package:flutter/material.dart';
import 'package:tentura/ui/utils/ui_utils.dart';

import '../../domain/entity/beacon.dart';
import 'beacon_author_info.dart';
import 'beacon_info.dart';
import 'beacon_tile_control.dart';

class BeaconTile extends StatelessWidget {
  const BeaconTile({
    required this.beacon,
    super.key,
  });

  final Beacon beacon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final author = beacon.author;
    return Padding(
      padding: kPaddingV,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User row (Avatar and Name)
          BeaconAuthorInfo(
              author: author, textTheme: textTheme, beacon: beacon),

          // Beacon Info
          BeaconInfo(beacon: beacon),

          // Beacon Control
          BeaconTileControl(beacon: beacon),
        ],
      ),
    );
  }
}
