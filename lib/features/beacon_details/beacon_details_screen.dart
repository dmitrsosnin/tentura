import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/geolocation_repository.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/data/gql/beacon/_g/beacon_fetch_by_id.req.gql.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';
import 'package:gravity/ui/widget/error_center_text.dart';

import 'widget/new_comment_input.dart';
import 'widget/beacon_vote_control.dart';
import 'widget/comments_expansion_tile.dart';

class BeaconDetailsScreen extends StatelessWidget {
  static const _requestId = 'FetchBeaconById';

  const BeaconDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final beaconId = GoRouterState.of(context).uri.queryParameters['id'];
    if (beaconId == null || beaconId.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Beacon')),
        body: Center(
          child: Text(
            'Beacon identifier is wrong!',
            style: textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.onError,
            ),
          ),
        ),
      );
    }
    final refreshRequest = GBeaconFetchByIdReq(
      (b) => b
        ..requestId = _requestId + beaconId
        ..fetchPolicy = FetchPolicy.NetworkOnly
        ..vars.id = beaconId,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Beacon')),
      bottomSheet: NewCommentInput(
        beaconId: beaconId,
        refreshRequest: refreshRequest,
      ),
      body: Operation(
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
                ? const Center(child: CircularProgressIndicator.adaptive())
                : ErrorCenterText(response: response, error: error);
          }
          final isNotMine = beacon.author.id != GetIt.I<AuthRepository>().myId;
          return RefreshIndicator.adaptive(
            onRefresh: () async =>
                GetIt.I<Client>().requestController.add(refreshRequest),
            child: ListView(
              padding: paddingAll20,
              children: [
                // User row (Avatar and Name)
                if (isNotMine)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
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
                  ),
                // Title
                Text(
                  beacon.title,
                  style: textTheme.headlineMedium,
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
                // Description
                if (beacon.description.isNotEmpty)
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
                if (isNotMine)
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 64),
                    child: CommentsExpansionTile(
                      key: ObjectKey(beacon),
                      beacon: beacon,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
