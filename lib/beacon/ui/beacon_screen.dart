import 'package:flutter/material.dart';

import 'new_beacon_screen.dart';
import 'widget/my_beacons_list.dart';

class BeaconScreen extends StatelessWidget {
  const BeaconScreen({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: const [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.search_rounded),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.qr_code_2_rounded),
              ),
            ],
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton.icon(
                label: const Text('71%'),
                icon: const Icon(Icons.percent_rounded),
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
              ),
            ),
            leadingWidth: 120,
            bottom: const TabBar(
              tabs: [
                Text('My beacons'),
                Text('My reactions'),
              ],
            ),
          ),
          body: TabBarView(children: [
            MyBeaconList(),
            const Center(child: Text('Nothing here yet')),
          ]),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NewBeaconScreen(),
            )),
          ),
        ),
      );
}
