import 'package:flutter/material.dart';

import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ui_consts.dart';

import 'package:tentura/features/my_field/ui/widget/beacon_tile.dart';

import '../bloc/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeFavorites,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const FavoritesScreen(),
      );

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: paddingH20,
      child: BlocConsumer<FavoritesCubit, FavoritesState>(
        listenWhen: (p, c) => c.hasError,
        listener: (context, state) {
          showSnackBar(
            context,
            isError: true,
            text: state.error?.toString(),
          );
        },
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
}
