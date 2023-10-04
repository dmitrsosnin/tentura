import 'package:gravity/app/router.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/image_repository.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/features/beacon/data/_g/beacon_delete_by_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';

class BeaconDeleteDialog extends StatelessWidget {
  final GBeaconFields beacon;

  const BeaconDeleteDialog({
    required this.beacon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Are you sure you want to delete this beacon?'),
        actions: [
          TextButton(
            onPressed: () async {
              final response = await doRequest(
                context: context,
                request: GBeaconDeleteByIdReq((b) => b.vars..id = beacon.id),
              );
              if (response.hasNoErrors && beacon.has_picture) {
                await GetIt.I<ImageRepository>().deleteBeacon(
                  userId: GetIt.I<AuthRepository>().myId,
                  beaconId: beacon.id,
                );
              }
              if (context.mounted) context.pop();
            },
            child: const Text('Delete'),
          ),
          TextButton(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
