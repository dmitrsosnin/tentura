import 'package:gravity/data/auth_repository.dart';

import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/rating_button.dart';
import 'package:gravity/features/beacon/widget/beacon_tile.dart';

import 'data/_g/beacon_fetch_my_field.req.gql.dart';

class MyFieldScreen extends StatelessWidget {
  static const _requestId = 'FetchMyField';

  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const RatingButton(),
          leadingWidth: RatingButton.width,
        ),
        body: Operation(
          client: GetIt.I<Client>(),
          operationRequest: GBeaconFetchMyFieldReq(
            (b) => b
              ..requestId = _requestId
              ..vars.user_id = GetIt.I<AuthRepository>().myId,
          ),
          builder: (context, response, error) =>
              showLoaderOrErrorOr(response, error) ??
              RefreshIndicator.adaptive(
                onRefresh: () async => GetIt.I<Client>()
                    .requestController
                    .add(GBeaconFetchMyFieldReq(
                      (b) => b
                        ..requestId = _requestId
                        ..fetchPolicy = FetchPolicy.NetworkOnly
                        ..vars.user_id = GetIt.I<AuthRepository>().myId,
                    )),
                child: ListView.separated(
                  cacheExtent: 5,
                  padding: const EdgeInsets.all(20),
                  itemCount: response!.data!.beacon.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, i) => BeaconTile(
                    beacon: response.data!.beacon[i],
                  ),
                ),
              ),
        ),
      );
}
