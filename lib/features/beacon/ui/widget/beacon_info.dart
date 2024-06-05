import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/beacon_image.dart';
import 'package:tentura/ui/widget/place_name_text.dart';

class BeaconInfo extends StatelessWidget {
  const BeaconInfo({
    required this.beacon,
    super.key,
  });

  final Beacon beacon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => context.push(Uri(
        path: pathBeaconView,
        queryParameters: {'id': beacon.id},
      ).toString()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Beacon Image
          if (beacon.has_picture)
            Padding(
              padding: paddingSmallV,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: BeaconImage(
                  authorId: beacon.author.id,
                  beaconId: beacon.imageId,
                  width: 300,
                ),
              ),
            ),

          // Beacon Title
          Padding(
            padding: paddingSmallV,
            child: Text(
              beacon.title,
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: textTheme.headlineLarge,
            ),
          ),

          // Beacon Description
          if (beacon.description.isNotEmpty)
            Text(
              beacon.description,
              maxLines: 3,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodyLarge,
            ),

          // Beacon Timerange
          if (beacon.timerange != null)
            Text(
              '${fYMD(beacon.timerange?.start)} - ${fYMD(beacon.timerange?.end)}',
            ),

          // Beacon Geolocation
          if (beacon.place != null)
            PlaceNameText(
              coords: (
                lat: beacon.place!.latitude,
                long: beacon.place!.longitude,
              ),
              style: textTheme.bodyLarge,
            ),
        ],
      ),
    );
  }
}
