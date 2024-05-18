import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/widget/empty_list_scroll_view.dart';

import 'package:tentura/features/auth/ui/bloc/auth_cubit.dart';
import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/beacon/ui/widget/beacon_tile.dart';

import '../../data/gql/_g/beacon_fetch_pinned_by_user_id.req.gql.dart';

class FavoritesScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeFavorites,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const FavoritesScreen(),
      );

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void request(GBeaconFetchPinnedByUserIdReqBuilder r) => r
      ..requestId = 'BeaconFetchPinned'
      ..vars.user_id = context.read<AuthCubit>().state.currentAccount;
    return SafeArea(
      minimum: paddingH20,
      child: Operation(
        client: GetIt.I<Client>(),
        operationRequest: GBeaconFetchPinnedByUserIdReq(request),
        builder: (context, response, error) =>
            showLoaderOrErrorOr(response, error) ??
            RefreshIndicator.adaptive(
              onRefresh: () async => GetIt.I<Client>()
                  .requestController
                  .add(GBeaconFetchPinnedByUserIdReq(request)),
              child: response?.data?.beacon_pinned.isEmpty ?? false
                  ? const EmptyListScrollView()
                  : ListView.separated(
                      itemCount: response!.data!.beacon_pinned.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, i) => BeaconTile(
                        key: ValueKey(response.data!.beacon_pinned[i]),
                        beacon:
                            response.data!.beacon_pinned[i].beacon as Beacon,
                        withAvatar: true,
                        isMine: false,
                      ),
                    ),
            ),
      ),
    );
  }
}
