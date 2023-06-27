import 'package:flutter/material.dart';

import 'package:gravity/_shared/ui/widget/qr_code_button.dart';
import 'package:gravity/_shared/ui/widget/rating_button.dart';
import 'package:gravity/_shared/ui/widget/search_button.dart';

import 'new_beacon_screen.dart';
import 'widget/my_beacons_list.dart';

class BeaconScreen extends StatelessWidget {
  const BeaconScreen({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: const [
              SearchButton(),
              QrCodeButton(),
            ],
            leading: const Padding(
              padding: EdgeInsets.all(8),
              child: RatingButton(),
            ),
            leadingWidth: RatingButton.width,
            bottom: const TabBar(
              tabs: [
                Text('My beacons'),
                Text('My reactions'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MyBeaconList(key: Key('MyBeaconList')),
              Center(child: Text('Nothing here yet')),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'FAB.NewBeacon',
            child: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const NewBeaconScreen(),
              ),
            ),
          ),
        ),
      );
}
