import 'package:gravity/data/gql/beacon/_g/beacon_search_by_id.req.gql.dart';

import 'package:gravity/ui/ferry.dart';
import 'package:gravity/ui/widget/rating_button.dart';
import 'package:gravity/ui/widget/error_center_text.dart';
import 'package:gravity/features/beacon_details/widget/beacon_tile.dart';

class MyFieldScreen extends StatelessWidget {
  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const RatingButton(),
          leadingWidth: RatingButton.width,
        ),
        body: Operation(
          client: GetIt.I<Client>(),
          operationRequest:
              GBeaconSearchByIdReq((b) => b.vars.startsWith = '%'),
          builder: (context, response, error) {
            if (response?.loading ?? false) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (response?.data == null) {
              return ErrorCenterText(response: response, error: error);
            }
            return RefreshIndicator.adaptive(
              onRefresh: () async {},
              child: ListView.separated(
                cacheExtent: 5,
                padding: const EdgeInsets.all(20),
                itemCount: response!.data!.beacon.length,
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
