import 'package:gravity/app/router.dart';
import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/geolocation_repository.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';

import 'package:gravity/ui/utils.dart';
import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';

import 'beacon_control_row.dart';

class BeaconTile extends StatelessWidget {
  final GBeaconFields beacon;
  final bool isMine;

  const BeaconTile({
    required this.beacon,
    this.isMine = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMine)
          GestureDetector(
            onTap: () => context.push(Uri(
              path: pathProfile,
              queryParameters: {'id': beacon.author.id},
            ).toString()),
            child: Row(
              children: [
                // Avatar
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: AvatarImage(
                    userId: beacon.author.imageId,
                    size: 40,
                  ),
                ),
                // User displayName
                Text(
                  beacon.author.title,
                  style: textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        GestureDetector(
          onTap: () => context.push(Uri(
            path: pathBeaconView,
            queryParameters: {'id': beacon.id},
          ).toString()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Beacon Title
              Padding(
                padding: paddingV8,
                child: Text(
                  beacon.title,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineLarge,
                ),
              ),
              // Beacon Image
              if (beacon.has_picture)
                Padding(
                  padding: paddingV8,
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
              // Beacon Description
              if (beacon.description.isNotEmpty)
                Text(
                  beacon.description,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyLarge,
                ),
              if (beacon.timerange != null)
                Text(
                  '${fYMD(beacon.timerange?.start)} - ${fYMD(beacon.timerange?.end)}',
                ),
              if (beacon.place != null)
                FutureBuilder(
                  key: Key(beacon.id),
                  future: GetIt.I<GeolocationRepository>()
                      .getPlaceNameByCoords(beacon.place!),
                  builder: (context, snapshot) => Text(
                    snapshot.data == null
                        ? beacon.place!.toSexagesimal()
                        : '${snapshot.data?.locality}, ${snapshot.data?.country}',
                    style: textTheme.bodyLarge,
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: paddingV8,
          child: BeaconControlRow(beacon: beacon, isMine: isMine),
        ),
      ],
    );
  }
}
