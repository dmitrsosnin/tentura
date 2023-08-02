import 'package:gravity/app/router.dart';
import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/geolocation_repository.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/features/beacon/widget/beacon_popup_menu.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';
import 'package:gravity/features/beacon/widget/beacon_vote_control.dart';

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
          Row(
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
        Row(
          children: [
            // Beacon Title
            Expanded(
              child: GestureDetector(
                child: Text(
                  beacon.title,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineLarge,
                ),
                onTap: () => context.push(Uri(
                  path: pathBeaconDetails,
                  queryParameters: {'id': beacon.id},
                ).toString()),
              ),
            ),
            // Menu
            BeaconPopupMenu(
              beacon: beacon,
              isMine: isMine,
            ),
          ],
        ),
        // Beacon Image
        if (beacon.has_picture)
          GestureDetector(
            onTap: () => context.push(Uri(
              path: pathBeaconDetails,
              queryParameters: {'id': beacon.id},
            ).toString()),
            child: Padding(
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
            '${beacon.timerange?.start} - ${beacon.timerange?.end}',
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
        Padding(
          padding: paddingV8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Comments count
              Text(
                'Comments: ${beacon.comments_count}',
                style: textTheme.bodyLarge,
              ),
              // Like\Dislike
              if (!isMine) BeaconVoteControl(beacon: beacon),
            ],
          ),
        ),
      ],
    );
  }
}
