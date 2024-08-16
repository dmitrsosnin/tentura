import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import 'package:tentura/features/my_field/ui/widget/beacon_tile.dart';

import '../bloc/favorites_cubit.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: paddingMediumH,
        child: BlocConsumer<FavoritesCubit, FavoritesState>(
          listenWhen: (p, c) => c.hasError,
          listener: showSnackBarError,
          buildWhen: (p, c) => c.hasNoError,
          builder: (context, state) => RefreshIndicator.adaptive(
            onRefresh: context.read<FavoritesCubit>().fetch,
            child: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : state.beacons.isEmpty
                    ? CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text('Nothing here yet'),
                            ),
                          ),
                        ],
                      )
                    : ListView.separated(
                        itemCount: state.beacons.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, i) => BeaconTile(
                          key: ValueKey(state.beacons[i]),
                          beacon: state.beacons[i],
                        ),
                      ),
          ),
        ),
      );
}
