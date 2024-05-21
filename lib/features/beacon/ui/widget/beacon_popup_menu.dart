import 'package:flutter/material.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import '../bloc/beacon_cubit.dart';
import '../dialog/beacon_delete_dialog.dart';

class BeaconPopupMenu extends StatelessWidget {
  final String id;

  const BeaconPopupMenu({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<void>(
      itemBuilder: (context) {
        final beaconCubit = context.read<BeaconCubit>();
        return [
          PopupMenuItem<void>(
            child:
                beaconCubit.state.beacons.singleWhere((e) => e.id == id).enabled
                    ? const Text('Disable beacon')
                    : const Text('Enable beacon'),
            onTap: () async {
              try {
                await beaconCubit.toggleEnabled(id);
              } catch (e) {
                if (context.mounted) {
                  showSnackBar(
                    context,
                    isError: true,
                    text: e.toString(),
                  );
                }
              }
            },
          ),
          const PopupMenuDivider(),
          PopupMenuItem<void>(
            child: const Text('Delete beacon'),
            onTap: () => BeaconDeleteDialog.show(context, id: id),
          ),
        ];
      },
    );
  }
}
