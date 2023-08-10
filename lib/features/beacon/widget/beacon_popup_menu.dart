import 'package:gravity/data/gql/beacon/_g/_fragments.data.gql.dart';
import 'package:gravity/features/beacon/data/_g/beacon_update_by_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/dialog/share_code_dialog.dart';
import 'package:gravity/features/beacon/dialog/beacon_hide_dialog.dart';
import 'package:gravity/features/beacon/dialog/beacon_delete_dialog.dart';

class BeaconPopupMenu extends StatelessWidget {
  final GBeaconFields beacon;
  final bool isMine;

  const BeaconPopupMenu({
    required this.beacon,
    required this.isMine,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PopupMenuButton<void>(
        itemBuilder: (context) => [
          PopupMenuItem<void>(
            child: const Text('Graph view'),
            onTap: () {},
          ),
          const PopupMenuDivider(),
          if (isMine) ...[
            PopupMenuItem<void>(
              child: beacon.enabled
                  ? const Text('Disable beacon')
                  : const Text('Enable beacon'),
              onTap: () => doRequest(
                context: context,
                request: GBeaconUpdateByIdReq(
                  (b) => b
                    ..vars.id = beacon.id
                    ..vars.enabled = !beacon.enabled,
                ),
              ),
            ),
            const PopupMenuDivider(),
            PopupMenuItem<void>(
              child: const Text('Delete beacon'),
              onTap: () => BeaconDeleteDialog.show(context, beacon: beacon),
            ),
          ],
          if (!isMine)
            PopupMenuItem<void>(
              enabled: beacon.is_hidden == false,
              child: const Text('Hide from My field'),
              onTap: () => BeaconHideDialog.show(context, beacon: beacon),
            ),
          const PopupMenuDivider(),
          PopupMenuItem<void>(
            child: const Text('Share'),
            onTap: () => Future.delayed(
              const Duration(milliseconds: 1),
              () => showDialog<void>(
                context: context,
                builder: (context) => ShareCodeDialog(id: beacon.id),
              ),
            ),
          ),
        ],
      );
}
