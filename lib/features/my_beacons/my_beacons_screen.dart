import 'package:gravity/app/router.dart';

import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/beacon/_g/beacon_fetch_by_user_id.req.gql.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/rating_button.dart';

import 'widget/my_beacon_tile.dart';

class MyBeaconsScreen extends StatelessWidget {
  static const _requestId = 'FetchMyBeacons';

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
            (b) => b
              ..requestId = _requestId
              ..vars.user_id = GetIt.I<AuthRepository>().myId,
          ),
          builder: (context, response, error) =>
              showLoaderOrErrorOr(response, error) ??
              RefreshIndicator.adaptive(
                onRefresh: () async => GetIt.I<Client>()
                    .requestController
                    .add(GBeaconFetchByUserIdReq(
                      (b) => b
                        ..requestId = _requestId
                        ..fetchPolicy = FetchPolicy.NetworkOnly
                        ..vars.user_id = GetIt.I<AuthRepository>().myId,
                    )),
                child: response!.data!.beacon.isEmpty
                    ? ListView(
                        children: [
                          Text(
                            'Nothing here yet\n'
                            'Find your friends to get started!',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      )
                    : ListView.separated(
                        cacheExtent: 5,
                        padding: paddingAll20,
                        itemCount: response.data!.beacon.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, i) => MyBeaconTile(
                          beacon: response.data!.beacon[i],
                        ),
                      ),
              ),
        ),
      );
}
