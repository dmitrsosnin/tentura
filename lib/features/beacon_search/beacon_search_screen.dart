import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:gravity/data/api_service.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/data/gql/beacon/_g/search_beacon.req.gql.dart';
import 'package:gravity/features/beacon_details/beacon_details_screen.dart';

class BeaconSearchScreen extends StatefulWidget {
  const BeaconSearchScreen({super.key});

  @override
  State<BeaconSearchScreen> createState() => _BeaconSearchScreenState();
}

class _BeaconSearchScreenState extends State<BeaconSearchScreen> {
  var _prefix = '';

  @override
  Widget build(BuildContext context) => Operation(
        client: GetIt.I<ApiService>().ferry,
        operationRequest: GSearchBeaconReq(
          (b) => b.vars.startsWith = '$_prefix%',
        ),
        builder: (context, result, error) => Scaffold(
          appBar: AppBar(
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Type a Code',
                suffixIcon: result?.loading ?? false
                    ? Transform.scale(
                        scale: 0.5,
                        child: const CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.search_rounded),
              ),
              onChanged: (value) =>
                  value.length > 2 ? setState(() => _prefix = value) : null,
            ),
          ),
          body: result?.data == null
              ? Container()
              : ListView(
                  children: [
                    for (final e in result!.data!.beacon)
                      ListTile(
                        leading: AvatarImage(
                          size: 40,
                          userId: e.author.has_picture ? e.author.id : '',
                        ),
                        title: Text(e.title),
                        subtitle: Text(
                          e.description,
                          maxLines: 1,
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                BeaconDetailsScreen(beacon: e),
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      );
}
