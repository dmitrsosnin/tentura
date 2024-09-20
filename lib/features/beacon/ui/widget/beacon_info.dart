import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/beacon_image.dart';
import 'package:tentura/ui/widget/tentura_icons.dart';
import 'package:tentura/ui/widget/place_name_text.dart';
import 'package:tentura/ui/dialog/choose_location_dialog.dart';
import 'package:tentura/ui/widget/show_more_text.dart';

import '../../domain/entity/beacon.dart';

class BeaconInfo extends StatelessWidget {
  const BeaconInfo({
    required this.beacon,
    this.isTitleLarge = false,
    super.key,
  });

  final Beacon beacon;
  final bool isTitleLarge;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: context.routeData.name == BeaconViewRoute.name
          ? null
          : () => context.pushRoute(BeaconViewRoute(id: beacon.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Beacon Image
          if (beacon.hasPicture)
            Padding(
              padding: kPaddingSmallT,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: BeaconImage(
                  authorId: beacon.author.imageId,
                  beaconId: beacon.imageId,
                ),
              ),
            ),

          // Beacon Title
          Padding(
            padding: kPaddingT,
            child: Text(
              beacon.title,
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: isTitleLarge
                  ? textTheme.headlineLarge
                  : textTheme.headlineMedium,
            ),
          ),

          // Beacon Description
          if (beacon.description.isNotEmpty)
            Padding(
              padding: kPaddingSmallT,
              child: ShowMoreText(
                beacon.description,
              ),
            ),

          // Beacon Timerange and Geolocation
          if (beacon.dateRange != null || beacon.coordinates != null)
            Padding(
              padding: kPaddingSmallT,
              child: Wrap(
                runSpacing: kSpacingSmall,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  // Beacon Timerange
                  if (beacon.dateRange != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: kSpacingSmall),
                          child: Icon(
                            TenturaIcons.calendar,
                            size: 18,
                          ),
                        ),
                        Text(
                          '${fYMD(beacon.dateRange?.start)}'
                          ' - ${fYMD(beacon.dateRange?.end)}',
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  // Beacon Geolocation
                  if (beacon.coordinates != null)
                    TextButton.icon(
                      icon: const Icon(
                        TenturaIcons.location,
                        size: 18,
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      label: kIsWeb
                          ? const Text('Show on the map')
                          : PlaceNameText(
                              coords: beacon.coordinates!,
                              style: textTheme.bodySmall,
                            ),
                      onPressed: () => ChooseLocationDialog.show(
                        context,
                        center: beacon.coordinates,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
