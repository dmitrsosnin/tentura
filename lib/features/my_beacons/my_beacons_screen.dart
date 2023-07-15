import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:gravity/data/api_service.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/ui/widget/rating_button.dart';

import 'package:gravity/features/beacon_create/beacon_create_screen.dart';

import 'package:gravity/data/gql/beacon/_g/fetch_beacon_by_user_id.req.gql.dart';

import 'widget/beacon_tile.dart';

class MyBeaconsScreen extends StatelessWidget {
  const MyBeaconsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.search_rounded),
            ),
          ],
          leading: const Padding(
            padding: EdgeInsets.all(8),
            child: RatingButton(),
          ),
          leadingWidth: RatingButton.width,
        ),
        body: Operation(
          client: GetIt.I<ApiService>().ferry,
          operationRequest: GFetchBeaconsByUserIdReq(
            (b) => b..vars.user_id = GetIt.I<AuthRepository>().myId,
          ),
          builder: (context, response, error) {
            if (error != null) return Text(error.toString());
            if (response?.graphqlErrors != null) {
              return Text(response!.graphqlErrors.toString());
            }
            if (response?.linkException != null) {
              return Text(response!.linkException.toString());
            }
            if (response == null || response.loading || response.data == null) {
              return const CircularProgressIndicator.adaptive();
            }
            if (response.data!.beacon.isEmpty) {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filled(
                    // TBD
                    onPressed: () {},
                    icon: const Icon(
                      Icons.refresh_outlined,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'Nothing here yet\n'
                    'Find your friends to get started!',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ));
            }
            return RefreshIndicator.adaptive(
              // TBD
              onRefresh: () async {},
              child: ListView.separated(
                cacheExtent: 5,
                padding: const EdgeInsets.all(20),
                itemCount: response.data!.beacon.length,
                itemBuilder: (context, i) =>
                    BeaconTile(beacon: response.data!.beacon[i]),
                separatorBuilder: (context, index) => const Divider(),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'FAB.NewBeacon',
          child: const Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => const BeaconCreateScreen(),
            ),
          ),
        ),
      );
}
