import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:gravity/data/api_service.dart';

import 'package:gravity/ui/widget/beacon_tile.dart';
import 'package:gravity/ui/widget/rating_button.dart';
import 'package:gravity/ui/widget/unknown_error_text.dart';
import 'package:gravity/data/gql/beacon/_g/search_beacon.req.gql.dart';

class MyFieldScreen extends StatelessWidget {
  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8),
            child: RatingButton(),
          ),
          leadingWidth: RatingButton.width,
        ),
        body: Operation(
          client: GetIt.I<ApiService>().ferry,
          operationRequest: GSearchBeaconReq((b) => b.vars.startsWith = '%'),
          builder: (context, response, error) {
            if (response?.loading ?? false) {
              return const CircularProgressIndicator.adaptive();
            } else if (response?.data == null) {
              return unknownErrorText;
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
