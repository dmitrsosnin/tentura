import 'package:flutter/material.dart';

import 'package:gravity/beacon/bloc/my_beacons_cubit.dart';

import 'beacon_tile.dart';

class MyBeaconList extends StatelessWidget {
  const MyBeaconList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = GetIt.I<MyBeaconsCubit>();
    return BlocBuilder<MyBeaconsCubit, MyBeaconsState>(
      bloc: cubit,
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
                onPressed: cubit.refresh,
                icon: const Icon(
                  Icons.refresh_outlined,
                  size: 48,
                ),
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
          onRefresh: cubit.refresh,
          child: ListView.separated(
            cacheExtent: 5,
            padding: const EdgeInsets.all(20),
            itemCount: state.beacons.length,
            itemBuilder: (context, i) => BeaconTile(beacon: state.beacons[i]),
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
      },
    );
  }
}
