import 'package:gravity/consts.dart';
import 'package:gravity/app/router.dart';
import 'package:gravity/data/gql/beacon/_g/_fragments.data.gql.dart';
import 'package:gravity/features/beacon/data/_g/beacon_update_by_id.req.gql.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/dialog/share_code_dialog.dart';
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
            onTap: () => ScaffoldMessenger.of(context)
                .showSnackBar(notImplementedSnackBar),
          ),
          if (isMine) ...[
            const PopupMenuDivider(),
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
              onTap: () => showDialog<void>(
                context: context,
                builder: (context) => BeaconDeleteDialog(beacon: beacon),
              ),
            ),
          ],
          const PopupMenuDivider(),
          PopupMenuItem<void>(
            child: const Text('Share'),
            onTap: () => showDialog<void>(
              context: context,
              builder: (context) => ShareCodeDialog(
                id: beacon.id,
                link: Uri.https(
                  appLinkBase,
                  pathBeaconView,
                  {'id': beacon.id},
                ).toString(),
              ),
            ),
          ),
        ],
      );
}
