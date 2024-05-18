import 'package:tentura/ui/utils/ferry_utils.dart';

import '../../domain/entity/beacon.dart';
import '../../data/gql/_g/beacon_update_by_id.req.gql.dart';
import '../dialog/beacon_delete_dialog.dart';

class BeaconPopupMenu extends StatelessWidget {
  final Beacon beacon;

  const BeaconPopupMenu({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PopupMenuButton<void>(
        itemBuilder: (context) => [
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
      );
}
