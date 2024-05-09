import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/widget/empty_list_scroll_view.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_tile.dart';

import '../../data/gql/_g/beacon_fetch_pinned_by_user_id.req.gql.dart';

class FavoritesScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeFavorites,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const FavoritesScreen(),
      );

  static const _requestId = 'BeaconFetchPinned';

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final client = GetIt.I<Client>();
    final myId = GetIt.I<AuthCubit>().state.currentAccount;
    return SafeArea(
      minimum: paddingH20,
      child: Operation(
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
                      itemCount: response!.data!.beacon_pinned.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, i) => BeaconTile(
                        beacon: response.data!.beacon_pinned[i].beacon,
                      ),
                    ),
            ),
      ),
    );
  }
}
