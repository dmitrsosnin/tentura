import 'package:flutter/material.dart';

class BeaconsScreen extends StatelessWidget {
  const BeaconsScreen({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.qr_code_2_rounded),
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
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Nothing here yet'),
                const Text('Find your friends to get started!'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Create one'),
                  ),
                ),
              ],
            )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Nothing here yet', textAlign: TextAlign.center),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      );
}
