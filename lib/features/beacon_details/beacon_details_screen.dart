import 'package:gravity/app/router.dart';

import 'package:gravity/data/gql/user/user_utils.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/data/gql/beacon/_g/beacon_fetch_by_id.req.gql.dart';

import 'package:gravity/ui/ferry.dart';
import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/beacon_image.dart';
import 'package:gravity/ui/widget/error_center_text.dart';
import 'package:gravity/ui/widget/like_control_button.dart';

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
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            )
          ],
        ),
        body: Operation(
            client: GetIt.I<Client>(),
            operationRequest: GBeaconFetchByIdReq(
              (b) => b
                ..executeOnListen = GoRouterState.of(context).extra == null
                ..vars.id = GoRouterState.of(context).uri.queryParameters['id'],
            ),
            builder: (context, response, error) {
              final beacon = response?.data?.beacon_by_pk ??
                  GoRouterState.of(context).extra as GBeaconFields?;
              if (beacon == null) {
                return response?.loading ?? false
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ErrorCenterText(response: response, error: error);
              }
              return RefreshIndicator.adaptive(
                onRefresh: () async => {},
                child: ListView(
                  padding: paddingH20,
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
                        const Icon(Icons.visibility_off_outlined),
                      ],
                    ),
                    // Image of Beacon
                    Container(
                      height: 200,
                      margin: paddingV8,
                      decoration: decorationRadius20,
                      child: BeaconImage(
                        authorId: beacon.author.id,
                        beaconId: beacon.imageId,
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
                      padding: paddingV8,
                      child: LikeControlButton(beaconId: beacon.id),
                    ),
                    // Comments
                    CommentsExpansionTile(beaconId: beacon.id),
                  ],
                ),
              );
            }),
      );
}
