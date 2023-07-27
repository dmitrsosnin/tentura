import 'package:gravity/data/gql/beacon/_g/beacon_search_by_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/rating_button.dart';
import 'package:gravity/features/beacon_details/widget/beacon_tile.dart';

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
          operationRequest: GBeaconSearchByIdReq(
            (b) => b
              ..requestId = _requestId
              ..vars.startsWith = '%',
          ),
          builder: (context, response, error) =>
              showLoaderOrErrorOr(response, error) ??
              RefreshIndicator.adaptive(
                onRefresh: () async => GetIt.I<Client>()
                    .requestController
                    .add(GBeaconSearchByIdReq(
                      (b) => b
                        ..requestId = _requestId
                        ..fetchPolicy = FetchPolicy.NetworkOnly
                        ..vars.startsWith = '%',
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
