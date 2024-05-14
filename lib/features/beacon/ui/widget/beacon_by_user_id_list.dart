import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

import '../../data/gql/_g/beacons_fetch_by_user_id.req.gql.dart';
import 'beacon_tile.dart';

class BeaconsByUserIdList extends StatelessWidget {
  const BeaconsByUserIdList({
    required this.userId,
    this.isMine = false,
    super.key,
  });

  final String userId;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Operation(
        client: GetIt.I<Client>(),
        operationRequest:
            GBeaconsFetchByUserIdReq((b) => b.vars.user_id = userId),
        builder: (context, response, error) {
          return showLoaderOrErrorOr(response, error) ??
              ListView.separated(
                itemCount: response?.data?.beacon.length ?? 0,
                itemBuilder: (context, i) => Padding(
                  padding: paddingH20,
                  child: BeaconTile(
                    beacon: response!.data!.beacon[i],
                    isMine: isMine,
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
              );
        });
  }
}
