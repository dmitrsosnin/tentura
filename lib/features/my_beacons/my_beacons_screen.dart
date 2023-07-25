import 'package:gravity/app/router.dart';

import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/beacon/_g/beacon_fetch_by_user_id.req.gql.dart';

import 'package:gravity/ui/ferry.dart';
import 'package:gravity/ui/widget/rating_button.dart';
import 'package:gravity/ui/widget/error_center_text.dart';
import 'package:gravity/features/beacon_details/widget/beacon_tile.dart';

class MyBeaconsScreen extends StatelessWidget {
  const MyBeaconsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const RatingButton(),
          leadingWidth: RatingButton.width,
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'FAB.NewBeacon',
          child: const Icon(Icons.add),
          onPressed: () => context.push(pathBeaconCreate),
        ),
        body: Operation(
          client: GetIt.I<Client>(),
          operationRequest: GBeaconFetchByUserIdReq(
            (b) => b..vars.user_id = GetIt.I<AuthRepository>().myId,
          ),
          builder: (context, response, error) {
            if (response?.loading ?? false) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (response?.data == null) {
              return ErrorCenterText(response: response, error: error);
            }
            return response!.data!.beacon.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton.filled(
                          icon: const Icon(
                            Icons.refresh_outlined,
                            size: 48,
                          ),
                          onPressed: () {}, // TBD
                        ),
                        const SizedBox(height: 48),
                        Text(
                          'Nothing here yet\n'
                          'Find your friends to get started!',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator.adaptive(
                    onRefresh: () async => GetIt.I<Client>()
                        .requestController
                        .add(GBeaconFetchByUserIdReq(
                          (b) => b
                            ..fetchPolicy = FetchPolicy.CacheAndNetwork
                            ..vars.user_id = GetIt.I<AuthRepository>().myId,
                        )),
                    child: ListView.separated(
                      cacheExtent: 5,
                      padding: const EdgeInsets.all(20),
                      itemCount: response.data!.beacon.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, i) => BeaconTile(
                        beacon: response.data!.beacon[i],
                      ),
                    ),
                  );
          },
        ),
      );
}
