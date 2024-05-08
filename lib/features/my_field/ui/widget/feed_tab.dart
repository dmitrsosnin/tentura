import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

import 'package:tentura/features/beacon/ui/widget/beacon_tile.dart';

import '../bloc/my_field_cubit.dart';

class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final dividerDecoration = BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
      ),
    );
    return BlocBuilder<MyFieldCubit, MyFieldState>(
      builder: (context, state) => RefreshIndicator.adaptive(
        onRefresh: context.read<MyFieldCubit>().fetch,
        child: switch (state.status) {
          FetchStatus.isFailure => const Center(child: Text('Error')),
          FetchStatus.isLoading => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          FetchStatus.isSuccess => ListView.builder(
              padding: paddingAll20,
              itemCount: state.beacons.length,
              itemBuilder: (context, i) {
                final beacon = state.beacons[i];
                return Container(
                  decoration: dividerDecoration,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: BeaconTile(beacon: beacon),
                );
              },
            ),
        },
      ),
    );
  }
}
