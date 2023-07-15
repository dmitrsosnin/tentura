import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:gravity/entity/beacon.dart';
import 'package:gravity/data/gql_queries.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';

import 'widget/beacon_buttons_row.dart';
import 'widget/comments_expansion_tile.dart';

class BeaconDetailsScreen extends StatelessWidget {
  final Beacon beacon;

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
        body: Query(
          options: QueryOptions(
            document: gql(qFetchBeaconsOf),
            variables: {'user_id': beacon.author.id},
            fetchPolicy: FetchPolicy.cacheFirst,
            parserFn: Beacon.fromJson,
            optimisticResult: beacon,
          ),
          builder: (
            QueryResult result, {
            VoidCallback? refetch,
            FetchMore? fetchMore,
          }) {
            final beacon = result.parsedData as Beacon? ?? this.beacon;
            return RefreshIndicator.adaptive(
              onRefresh: () async => refetch?.call(),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // User row (Avatar and Name)
                  Row(
                    children: [
                      AvatarImage(
                        userId:
                            beacon.author.hasPicture ? beacon.author.id : '',
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
                      beaconId: beacon.hasPicture ? beacon.id : '',
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
                    beacon.createdAt.toString(),
                  ),
                  // Place
                  if (beacon.coordinates != null)
                    Text(
                      beacon.coordinates!.toSexagesimal(),
                    ),
                  const Divider(),
                  // Buttons Row
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: BeaconButtonsRow(beacon: beacon),
                  ),
                  const Divider(),
                  // Comments
                  CommentsExpansionTile(beacon: beacon),
                ],
              ),
            );
          },
        ),
      );
}
