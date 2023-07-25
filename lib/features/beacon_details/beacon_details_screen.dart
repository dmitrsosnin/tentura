import 'package:gravity/app/router.dart';

import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/data/gql/beacon/_g/beacon_fetch_by_id.req.gql.dart';

import 'package:gravity/ui/ferry.dart';
import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';
import 'package:gravity/ui/widget/error_center_text.dart';
import 'package:gravity/features/beacon_details/widget/beacon_vote_control.dart';

import 'widget/comments_expansion_tile.dart';

class BeaconDetailsScreen extends StatelessWidget {
  const BeaconDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Beacon'),
          bottom: appBarBottomLine,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: Operation(
            client: GetIt.I<Client>(),
            operationRequest: GBeaconFetchByIdReq(
              (b) => b
                ..vars.id = GoRouterState.of(context).uri.queryParameters['id'],
            ),
            builder: (context, response, error) {
              final beacon = response?.data?.beacon_by_pk;
              if (beacon == null) {
                return response?.loading ?? false
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : ErrorCenterText(response: response, error: error);
              }
              return Padding(
                padding: paddingAll20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Image of Beacon
                    ClipRRect(
                      borderRadius: borderRadius20,
                      child: BeaconImage(
                        authorId: beacon.author.id,
                        beaconId: beacon.imageId,
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 8),
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
                      padding: paddingV8,
                      child: BeaconVoteControl(beacon: beacon),
                    ),
                    // Comments
                    CommentsExpansionTile(beacon: beacon),
                  ],
                ),
              );
            }),
      );
}
