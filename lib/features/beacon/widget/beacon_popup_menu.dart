import 'package:gravity/data/gql/beacon/_g/_fragments.data.gql.dart';
import 'package:gravity/features/beacon/dialog/beacon_delete_dialog.dart';
import 'package:gravity/features/beacon/data/_g/beacon_update_by_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';

class BeaconPopupMenu extends StatelessWidget {
  final GBeaconFields beacon;
  final bool isMine;

  const BeaconPopupMenu({
    required this.beacon,
    required this.isMine,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PopupMenuButton(
        itemBuilder: (context) => isMine
            ? [
                PopupMenuItem<void>(
                  child: const Text('Graph view'),
                  onTap: () {},
                ),
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
                PopupMenuItem<void>(
                  child: const Text('Delete beacon'),
                  onTap: () => BeaconDeleteDialog.show(context, beacon: beacon),
                ),
                PopupMenuItem<void>(
                  child: const Text('Share'),
                  onTap: () {},
                ),
              ]
            : const [
                PopupMenuItem<void>(
                  child: Text('Hide from My field'),
                ),
                PopupMenuItem<void>(
                  child: Text('Share'),
                ),
              ],
      );
}
