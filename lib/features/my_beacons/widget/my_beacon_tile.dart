import 'package:flutter/material.dart';

import 'package:gravity/app/router.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/widget/beacon_image.dart';

class MyBeaconTile extends StatelessWidget {
  final GBeaconFields beacon;

  const MyBeaconTile({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Beacon Title
            Text(
              beacon.title,
              maxLines: 1,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: textTheme.headlineLarge,
            ),
            // Menu
            PopupMenuButton(
              itemBuilder: (context) => const [
                PopupMenuItem<void>(
                  child: Text('Disable beacon'),
                ),
                PopupMenuItem<void>(
                  child: Text('Share the code'),
                ),
                PopupMenuItem<void>(
                  child: Text('Graph view'),
                ),
              ],
            ),
          ],
        ),
        // Beacon Image
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
        // Comments count
        Padding(
          padding: paddingV8,
          child: Text(
            'Comments: ${beacon.comments_count}',
            style: textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
