import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/features/context/ui/bloc/context_cubit.dart';
import 'package:tentura/ui/dialog/choose_location_dialog.dart';
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
      onTap: context.routeData.name == BeaconViewRoute.name
          ? null
          : () => context.pushRoute(BeaconViewRoute(id: beacon.id)),
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

          // Beacon Context
          if (beacon.context != null && beacon.context!.isNotEmpty)
            TextButton.icon(
              icon: const Icon(Icons.add_circle_outline),
              iconAlignment: IconAlignment.end,
              label: Text(
                'Context: ${beacon.context!}',
                maxLines: 1,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyLarge,
              ),
              onPressed: () async {
                final hasAdded = await context.read<ContextCubit>().add(
                      name: beacon.context!,
                      select: false,
                    );
                if (context.mounted && hasAdded) {
                  showSnackBar(
                    context,
                    text: 'Context ${beacon.context} has been added.',
                  );
                }
              },
            ),

          // Beacon Timerange
          if (beacon.timerange != null)
            Text(
              '${fYMD(beacon.timerange?.start)}'
              ' - ${fYMD(beacon.timerange?.end)}',
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodyLarge,
            ),

          // Beacon Geolocation
          if (beacon.hasCoordinates)
            TextButton.icon(
              icon: const Icon(Icons.open_in_new),
              iconAlignment: IconAlignment.end,
              label: kIsWeb
                  ? const Text('Show place on the map')
                  : PlaceNameText(
                      coords: beacon.coordinates,
                      style: textTheme.bodyLarge,
                    ),
              onPressed: () => ChooseLocationDialog.show(
                context,
                center: beacon.coordinates,
              ),
            ),
        ],
      ),
    );
  }
}
