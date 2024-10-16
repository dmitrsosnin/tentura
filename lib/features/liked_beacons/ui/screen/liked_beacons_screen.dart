import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/beacon/ui/widget/beacon_tile.dart';

import '../bloc/liked_beacons_cubit.dart';

@RoutePage()
class LikedBeaconsScreen extends StatelessWidget {
  const LikedBeaconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final likedBeaconsCubit = GetIt.I<LikedBeaconsCubit>();
    return SafeArea(
      minimum: kPaddingH,
      child: RefreshIndicator.adaptive(
        onRefresh: likedBeaconsCubit.fetch,
        child: BlocConsumer<LikedBeaconsCubit, LikedBeaconsState>(
          bloc: likedBeaconsCubit,
          listenWhen: (p, c) => c.hasError,
          listener: showSnackBarError,
          buildWhen: (p, c) => c.hasNoError,
          builder: (context, state) {
            print('BEACONS COUNT!!!: ${state.beacons.length}');
            return state.isLoading
                // Loading state
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : state.beacons.isEmpty

                    // Empty state
                    ? CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'There is nothing here yet',
                                style: Theme.of(context).textTheme.displaySmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )

                    // Beacons list
                    : ListView.separated(
                        key: const PageStorageKey('LikedBeaconsListView'),
                        itemCount: state.beacons.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, i) {
                          final beacon = state.beacons[i];
                          return Padding(
                            padding: kPaddingV,
                            child: BeaconTile(
                              beacon: beacon,
                              key: ValueKey(beacon),
                            ),
                          );
                        },
                      );
          },
        ),
      ),
    );
  }
}
