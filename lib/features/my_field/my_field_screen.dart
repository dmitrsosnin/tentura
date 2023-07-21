import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:ferry_flutter/ferry_flutter.dart';

import 'package:gravity/data/gql/beacon/_g/search_beacon.req.gql.dart';
import 'package:gravity/ui/widget/error_center_text.dart';
import 'package:gravity/ui/widget/rating_button.dart';
import 'package:gravity/ui/widget/beacon_tile.dart';

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
          operationRequest: GSearchBeaconReq((b) => b.vars.startsWith = '%'),
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
