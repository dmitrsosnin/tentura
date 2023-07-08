import 'package:flutter/material.dart';

import 'package:gravity/_shared/ui/widget/rating_button.dart';

import 'package:gravity/beacon/ui/new_beacon_screen.dart';
import 'package:gravity/beacon/ui/page/my_beacons_page.dart';
import 'package:gravity/beacon/ui/page/my_reactions_page.dart';

class BeaconScreen extends StatelessWidget {
  const BeaconScreen({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
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
            bottom: const TabBar(
              tabs: [
                Text('My beacons'),
                Text('My reactions'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MyBeaconPage(),
              MyReactionsPage(),
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
