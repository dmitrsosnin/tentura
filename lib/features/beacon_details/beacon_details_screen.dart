import 'package:flutter/material.dart';

import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';
import 'package:gravity/ui/widget/like_control_button.dart';

import 'package:gravity/data/gql/beacon/_g/search_beacon.data.gql.dart';

import 'widget/comments_expansion_tile.dart';

class BeaconDetailsScreen extends StatelessWidget {
  final GSearchBeaconData_beacon beacon;

  const BeaconDetailsScreen({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Beacon'),
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 1),
            child: Divider(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            )
          ],
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async => {},
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              // User row (Avatar and Name)
              Row(
                children: [
                  AvatarImage(
                    userId: beacon.author.has_picture ? beacon.author.id : '',
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      beacon.author.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const Icon(Icons.visibility_off_outlined),
                ],
              ),
              // Image of Beacon
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: BeaconImage(
                  authorId: beacon.author.id,
                  beaconId: beacon.has_picture ? beacon.id : '',
                ),
              ),
              // Title
              Text(
                beacon.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              // Description
              Text(
                beacon.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              // Date
              Text(
                beacon.created_at.toString(),
              ),
              // Place
              if (beacon.place != null)
                Text(
                  beacon.place!.toSexagesimal(),
                ),
              // Buttons Row
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: LikeControlButton(beaconId: beacon.id),
              ),
              // Comments
              CommentsExpansionTile(beaconId: beacon.id),
            ],
          ),
        ),
      );
}
