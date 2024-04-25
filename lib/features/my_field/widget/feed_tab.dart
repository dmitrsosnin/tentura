import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/features/beacon/widget/beacon_tile.dart';
import 'package:tentura/features/my_field/bloc/my_field_cubit.dart';
import 'package:tentura/features/beacon/dialog/beacon_hide_dialog.dart';

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
                  child: Dismissible(
                    key: ValueKey(beacon),
                    background: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Move to Pinned'),
                    ),
                    secondaryBackground: const Align(
                      alignment: Alignment.centerRight,
                      child: Text('Move to Hidden'),
                    ),
                    child: BeaconTile(beacon: beacon),
                    confirmDismiss: (direction) => switch (direction) {
                      // Hide Beacon
                      DismissDirection.endToStart =>
                        BeaconHideDialog.show(context).then(
                          (hideFor) => context
                              .read<MyFieldCubit>()
                              .hideBeacon(beacon.id, hideFor),
                        ),
                      // Pin Beacon
                      DismissDirection.startToEnd =>
                        context.read<MyFieldCubit>().pinBeacon(beacon.id),
                      // Do nothing
                      _ => Future.value(false),
                    },
                  ),
                );
              },
            ),
        },
      ),
    );
  }
}
