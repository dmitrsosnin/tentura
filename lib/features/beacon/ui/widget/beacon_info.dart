import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/ui/dialog/choose_location_dialog.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/widget/beacon_image.dart';
import 'package:tentura/ui/widget/place_name_text.dart';
import 'package:tentura/ui/widget/tentura_icons.dart';

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
    final hasCoordinates = beacon.lat != null && beacon.long != null;
    final coordinates = hasCoordinates
        ? (
            lat: double.tryParse(beacon.lat?.value ?? '.0') ?? 0,
            long: double.tryParse(beacon.long?.value ?? '.0') ?? 0,
          )
        : (lat: .0, long: .0);
    return GestureDetector(
      onTap: context.routeData.name == BeaconViewRoute.name
          ? null
          : () => context.pushRoute(BeaconViewRoute(id: beacon.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Beacon Image
          if (beacon.has_picture)
            Padding(
              padding: kPaddingSmallT,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: BeaconImage(
                  authorId: beacon.author.id,
                  beaconId: beacon.has_picture ? beacon.id : '',
                ),
              ),
            ),

          // Beacon Context
          if (beacon.context != null && beacon.context!.isNotEmpty)
            Padding(
              padding: kPaddingSmallT,
              child: Text(
                '#${beacon.context!}',
                maxLines: 1,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall,
              ),
            ),

          // Align(
          //   alignment: Alignment.centerRight,
          //   child: TextButton.icon(
          //     icon: const Icon(Icons.add_circle_outline),
          //     label: Text(
          //       beacon.context!,
          //       maxLines: 1,
          //       textAlign: TextAlign.right,
          //       overflow: TextOverflow.ellipsis,
          //       style: textTheme.bodySmall,
          //     ),
          //     onPressed: () async {
          //       await GetIt.I<ContextCubit>().add(
          //         contextName: beacon.context!,
          //         select: false,
          //       );
          //       if (context.mounted) {
          //         showSnackBar(
          //           context,
          //           text: 'Topic ${beacon.context} has been added.',
          //         );
          //       }
          //     },
          //   ),
          // ),

          // Beacon Title
          Padding(
            padding: kPaddingSmallT,
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
              child: Text(
                beacon.description,
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium,
              ),
            ),

          // Beacon Timerange and Geolocation
          if (beacon.timerange != null || hasCoordinates)
            Padding(
              padding: kPaddingSmallT,
              child: Wrap(
                runSpacing: kSpacingSmall,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  // Beacon Timerange
                  if (beacon.timerange != null)
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
                          '${fYMD(beacon.timerange?.start)}'
                          ' - ${fYMD(beacon.timerange?.end)}',
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  // Beacon Geolocation
                  if (hasCoordinates)
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
                              coords: coordinates,
                              style: textTheme.bodySmall,
                            ),
                      onPressed: () => ChooseLocationDialog.show(
                        context,
                        center: coordinates,
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
