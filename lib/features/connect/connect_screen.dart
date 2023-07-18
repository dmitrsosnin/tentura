import 'package:flutter/material.dart';

import 'package:gravity/ui/widget/rating_button.dart';

import 'package:gravity/features/beacon_search/beacon_search_screen.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8),
            child: RatingButton(),
          ),
          leadingWidth: RatingButton.width,
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {}, // TBD
          child: ListView(
            children: [
              Padding(
                // TBD: should be ralative
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  children: [
                    const Text(
                      'Nothing here yet\nFind your friends to get started!',
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: FilledButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const BeaconSearchScreen(),
                          ),
                        ),
                        child: const Text('Search by Code'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'or\nScan a QR',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
