import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/widget/empty_list_scroll_view.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/widget/beacon_tile.dart';

import '../data/_g/beacon_fetch_pinned_by_user_id.req.gql.dart';
import '../data/_g/beacon_unpin_by_id.req.gql.dart';

class PinnedTab extends StatelessWidget {
  static const _requestId = 'BeaconFetchPinned';

  const PinnedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final client = GetIt.I<Client>();
    final myId = GetIt.I<AuthCubit>().state.currentAccount;
    return Operation(
      client: client,
      operationRequest: GBeaconFetchPinnedByUserIdReq(
        (b) => b
          ..requestId = _requestId
          ..vars.user_id = myId,
      ),
      builder: (context, response, error) =>
          showLoaderOrErrorOr(response, error) ??
          RefreshIndicator.adaptive(
            onRefresh: () async =>
                client.requestController.add(GBeaconFetchPinnedByUserIdReq(
              (b) => b
                ..requestId = _requestId
                ..vars.user_id = myId,
            )),
            child: response?.data?.beacon_pinned.isEmpty ?? false
                ? const EmptyListScrollView()
                : ListView.separated(
                    padding: paddingAll20,
                    itemCount: response!.data!.beacon_pinned.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, i) {
                      final beacon = response.data!.beacon_pinned[i].beacon;
                      return Dismissible(
                        key: ValueKey(beacon),
                        background: Container(),
                        secondaryBackground: const Align(
                          alignment: Alignment.centerRight,
                          child: Text('Remove from Pinned'),
                        ),
                        direction: DismissDirection.endToStart,
                        child: BeaconTile(beacon: beacon),
                        confirmDismiss: (_) => doRequest(
                          context: context,
                          request: GBeaconUnpinByIdReq(
                            (b) => b
                              ..vars.user_id = myId
                              ..vars.beacon_id = beacon.id,
                          ),
                        ).then((value) => value.hasNoErrors),
                      );
                    },
                  ),
          ),
    );
  }
}
