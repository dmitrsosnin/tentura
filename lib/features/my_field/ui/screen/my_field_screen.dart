import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

import 'package:tentura/features/beacon/ui/widget/beacon_tile.dart';

import '../bloc/my_field_cubit.dart';

class MyFieldScreen extends StatelessWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeField,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const MyFieldScreen(),
      );

  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MyFieldCubit(),
        child: SafeArea(
          minimum: paddingH20,
          child: BlocBuilder<MyFieldCubit, MyFieldState>(
            builder: (context, state) {
              final decoration = BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              );
              return RefreshIndicator.adaptive(
                onRefresh: context.read<MyFieldCubit>().fetch,
                child: switch (state.status) {
                  FetchStatus.isFailure => const Center(
                      child: Text('Error'),
                    ),
                  FetchStatus.isLoading => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  FetchStatus.isSuccess => ListView.builder(
                      itemCount: state.beacons.length,
                      itemBuilder: (context, i) => Container(
                        decoration: decoration,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: BeaconTile(beacon: state.beacons[i]),
                      ),
                    ),
                },
              );
            },
          ),
        ),
      );
}
