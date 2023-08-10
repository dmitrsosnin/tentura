import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/features/my_field/data/_g/beacon_pin_by_id.req.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_unpin_by_id.req.gql.dart';

import 'package:gravity/ui/ferry_utils.dart';

class BeaconPinButton extends StatefulWidget {
  final GBeaconFields beacon;

  const BeaconPinButton({
    required this.beacon,
    super.key,
  });

  @override
  State<BeaconPinButton> createState() => _BeaconPinButtonState();
}

class _BeaconPinButtonState extends State<BeaconPinButton> {
  late bool _isPinned = widget.beacon.is_pinned ?? false;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          _isPinned ? Icons.favorite_outlined : Icons.favorite_outline_outlined,
        ),
        onPressed: () => _isPinned
            ? doRequest(
                context: context,
                request: GBeaconUnpinByIdReq(
                  (b) => b
                    ..vars.beacon_id = widget.beacon.id
                    ..vars.user_id = GetIt.I<AuthRepository>().myId,
                ),
              ).then(
                (response) {
                  final isPinned = response
                      .data?.delete_beacon_pinned_by_pk?.beacon.is_pinned;
                  if (isPinned != null) {
                    setState(() => _isPinned = isPinned);
                  }
                },
              )
            : doRequest(
                context: context,
                request: GBeaconPinByIdReq(
                  (b) => b..vars.beacon_id = widget.beacon.id,
                ),
              ).then(
                (response) {
                  final isPinned =
                      response.data?.insert_beacon_pinned_one?.beacon.is_pinned;
                  if (isPinned != null) {
                    setState(() => _isPinned = isPinned);
                  }
                },
              ),
      );
}
