import 'package:flutter/material.dart';

import 'package:gravity/_shared/ui/widget/rating_button.dart';

import 'package:gravity/field/bloc/my_field_cubit.dart';

import 'beacon_search_screen.dart';
import 'widget/scan_code_fab.dart';

class MyFieldScreen extends StatelessWidget {
  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.I<MyFieldCubit>();
    return BlocBuilder<MyFieldCubit, MyFieldState>(
      bloc: cubit,
      builder: (context, state) => state.beacons.isEmpty
          ? Scaffold(
              appBar: AppBar(
                leading: const Padding(
                  padding: EdgeInsets.all(8),
                  child: RatingButton(),
                ),
                leadingWidth: RatingButton.width,
              ),
              body: RefreshIndicator.adaptive(
                onRefresh: cubit.refresh,
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
                                  builder: (context) =>
                                      const BeaconSearchScreen(),
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
                          const ScanCodeFAB(heroTag: 'FAB.QRScan.MyField'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const BeaconSearchScreen(),
                      ),
                    ),
                  ),
                ],
                leading: const Padding(
                  padding: EdgeInsets.all(8),
                  child: RatingButton(),
                ),
                leadingWidth: RatingButton.width,
              ),
              body: RefreshIndicator.adaptive(
                onRefresh: cubit.refresh,
                child: ListView(),
              ),
              floatingActionButton: const ScanCodeFAB(
                heroTag: 'FAB.QRScan.MyField',
              ),
            ),
    );
  }
}
