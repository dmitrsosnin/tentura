import 'package:gravity/data/auth_repository.dart';

import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/features/beacon/widget/beacon_tile.dart';

import 'data/_g/beacon_fetch_my_field.req.gql.dart';

class MyFieldScreen extends StatelessWidget {
  static const _requestId = 'FetchMyField';

  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => <PopupMenuEntry<void>>[
                  PopupMenuItem<void>(
                    child: const Text('Input Code'),
                    onTap: () {},
                  ),
                  PopupMenuItem<void>(
                    child: const Text('Scan QR'),
                    onTap: () {},
                  ),
                ],
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Text('Pinned'),
                Text('Recommended'),
                Text('Hidden'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              const Center(child: Text('Nothing here yet')),
              Operation(
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
                      child: response?.data?.beacon.isEmpty ?? false
                          ? const Center(child: Text('Nothing here yet'))
                          : ListView.separated(
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
              const Center(child: Text('Nothing here yet')),
            ],
          ),
        ),
      );
}
