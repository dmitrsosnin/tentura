import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:gravity/beacon/bloc/my_beacons_cubit.dart';

import 'beacon_tile.dart';

class MyBeaconList extends StatelessWidget {
  MyBeaconList({super.key}) {
    _cubit.refresh(useCache: true);
  }

  final _cubit = GetIt.I<MyBeaconsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBeaconsCubit, MyBeaconsState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state.isEmpty) {
          return Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filled(
                onPressed: _cubit.refresh,
                icon: const Icon(Icons.refresh_outlined, size: 48),
              ),
              const SizedBox(height: 48),
              Text(
                'Nothing here yet\n'
                'Find your friends to get started!',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ));
        }
        return RefreshIndicator.adaptive(
          onRefresh: _cubit.refresh,
          child: ListView.separated(
            key: ObjectKey(state),
            cacheExtent: 5,
            padding: const EdgeInsets.all(20),
            itemCount: state.beacons.length,
            itemBuilder: (context, i) {
              final beacon = state.beacons[i];
              return BeaconTile(
                key: ObjectKey(beacon),
                beacon: beacon,
                futureAvatarImage: _cubit.getAvatarImageOf,
                futureBeaconImage: _cubit.getBeaconImageOf,
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
      },
    );
  }
}
