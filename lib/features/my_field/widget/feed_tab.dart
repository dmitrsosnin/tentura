import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/features/my_field/data/_g/beacon_pin_by_id.req.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_fetch_in_my_field.req.gql.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/empty_list_scroll_view.dart';
import 'package:gravity/features/beacon/widget/beacon_tile.dart';
import 'package:gravity/features/beacon/dialog/beacon_hide_dialog.dart';

class FeedTab extends StatelessWidget {
  static const _requestId = 'FetchMyField';

  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final client = GetIt.I<Client>();
    final myId = GetIt.I<AuthRepository>().myId;
    return Operation(
      client: client,
      operationRequest: GBeaconFetchInMyFieldReq(
        (b) => b
          ..requestId = _requestId
          ..vars.ego = myId,
      ),
      builder: (context, response, error) =>
          showLoaderOrErrorOr(response, error) ??
          RefreshIndicator.adaptive(
            onRefresh: () async =>
                client.requestController.add(GBeaconFetchInMyFieldReq(
              (b) => b
                ..fetchPolicy = FetchPolicy.NetworkOnly
                ..requestId = _requestId
                ..vars.ego = myId,
            )),
            child: response?.data?.scores.isEmpty ?? false
                ? const EmptyListScrollView()
                : ListView.separated(
                    padding: paddingAll20,
                    itemCount: response!.data!.scores.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, i) {
                      final beacon =
                          response.data!.scores[i].beacon as GBeaconFields;
                      // TBD: remove that ugly hack when able filter in request
                      if (beacon.author.id == myId) return const Offstage();
                      return Dismissible(
                        key: ValueKey(beacon),
                        background: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Move to Pinned'),
                        ),
                        secondaryBackground: const Align(
                          alignment: Alignment.centerRight,
                          child: Text('Move to Hidden'),
                        ),
                        child: BeaconTile(beacon: beacon),
                        confirmDismiss: (direction) => switch (direction) {
                          DismissDirection.startToEnd => doRequest(
                              context: context,
                              request: GBeaconPinByIdReq(
                                (b) => b..vars.beacon_id = beacon.id,
                              ),
                            ).then((value) => value.hasNoErrors),
                          DismissDirection.endToStart => showDialog<bool?>(
                              context: context,
                              builder: (context) => BeaconHideDialog(
                                beacon: beacon,
                              ),
                            ),
                          _ => Future.value(false),
                        },
                      );
                    },
                  ),
          ),
    );
  }
}
