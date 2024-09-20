import 'package:flutter/material.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/avatar_image.dart';

import '../../domain/entity/beacon.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => context.pushRoute(
            ProfileViewRoute(id: author.id),
          ),
          child: Row(
            children: [
              // Avatar
              Padding(
                padding: const EdgeInsets.only(right: kSpacingDefault),
                child: AvatarImage(
                  userId: author.imageId,
                  size: 40,
                ),
              ),

              // User displayName
              Text(
                author.title,
                style: textTheme.headlineMedium,
              ),
            ],
          ),
        ),

        // Beacon Info
        BeaconInfo(beacon: beacon),

        // Beacon Control
        Padding(
          padding: kPaddingSmallT,
          child: BeaconTileControl(beacon: beacon),
        ),
      ],
    );
  }
}
