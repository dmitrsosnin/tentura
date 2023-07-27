import 'package:gravity/app/router.dart';
import 'package:gravity/data/geolocation_repository.dart';

import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/data/gql/beacon/_g/beacon_fetch_by_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';
import 'package:gravity/ui/widget/error_center_text.dart';

import 'widget/beacon_vote_control.dart';
import 'widget/comments_expansion_tile.dart';

class BeaconDetailsScreen extends StatelessWidget {
  static const _requestId = 'FetchBeaconById';

  const BeaconDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final beaconId = GoRouterState.of(context).uri.queryParameters['id'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beacon'),
      ),
      body: beaconId == null || beaconId.isEmpty
          ? Center(
              child: Text(
              'Beacon not found',
              style: textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onError,
              ),
            ))
          : Operation(
              client: GetIt.I<Client>(),
              operationRequest: GBeaconFetchByIdReq(
                (b) => b
                  ..requestId = _requestId + beaconId
                  ..vars.id = beaconId,
              ),
              builder: (context, response, error) {
                final beacon = response?.data?.beacon_by_pk;
                if (beacon == null) {
                  return response?.loading ?? false
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : ErrorCenterText(response: response, error: error);
                }
                return RefreshIndicator.adaptive(
                  onRefresh: () async => GetIt.I<Client>()
                      .requestController
                      .add(GBeaconFetchByIdReq(
                        (b) => b
                          ..requestId = _requestId + beaconId
                          ..fetchPolicy = FetchPolicy.NetworkOnly
                          ..vars.id = beaconId,
                      )),
                  child: ListView(
                    padding: paddingAll20,
                    children: [
                      // User row (Avatar and Name)
                      Row(
                        children: [
                          AvatarImage(
                            userId: beacon.author.imageId,
                            size: 40,
                          ),
                          Padding(
                            padding: paddingH8,
                            child: Text(
                              beacon.author.title,
                              style: textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                      // Image of Beacon
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: paddingV20,
                        child: ClipRRect(
                          borderRadius: borderRadius20,
                          child: BeaconImage(
                            authorId: beacon.author.id,
                            beaconId: beacon.imageId,
                            height: 200,
                          ),
                        ),
                      ),
                      // Title
                      Text(
                        beacon.title,
                        style: textTheme.headlineMedium,
                      ),
                      // Description
                      Text(
                        beacon.description,
                        style: textTheme.bodyLarge,
                      ),
                      // Date
                      Text(
                        beacon.created_at.toString(),
                        style: textTheme.bodyLarge,
                      ),
                      // Place
                      if (beacon.place != null)
                        FutureBuilder(
                          key: Key(beaconId),
                          future: GetIt.I<GeolocationRepository>()
                              .getPlaceNameByCoords(beacon.place!),
                          builder: (context, snapshot) => Text(
                            snapshot.data == null
                                ? beacon.place!.toSexagesimal()
                                : '${snapshot.data?.locality}, ${snapshot.data?.country}',
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      // Buttons Row
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: paddingV8,
                        child: BeaconVoteControl(
                          key: ObjectKey(beacon),
                          beacon: beacon,
                        ),
                      ),
                      // Comments
                      if (beacon.comments_count > 0)
                        CommentsExpansionTile(beacon: beacon),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
