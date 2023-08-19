import 'package:gravity/app/router.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/features/beacon/data/_g/beacon_hide_by_id.req.gql.dart';
import 'package:gravity/ui/consts.dart';

import 'package:gravity/ui/ferry_utils.dart';

class BeaconHideDialog extends StatefulWidget {
  final GBeaconFields beacon;

  const BeaconHideDialog({
    required this.beacon,
    super.key,
  });

  @override
  State<BeaconHideDialog> createState() => _BeaconHideDialogState();
}

class _BeaconHideDialogState extends State<BeaconHideDialog> {
  var _hideUntil = const Duration(days: 1);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text(
          'Are you sure you want to hide this beacon from My Field?',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: paddingAll20,
              child: Text(
                'Hiding a beacon will not affect it’s rating.\n'
                'You will still be able to see the hidden beacon in its author’s profile.',
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Hide for 1 day'),
                Radio<Duration>.adaptive(
                  value: const Duration(days: 1),
                  groupValue: _hideUntil,
                  onChanged: (_) => setState(
                    () => _hideUntil = const Duration(days: 1),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Hide for 1 week'),
                Radio<Duration>.adaptive(
                  value: const Duration(days: 7),
                  groupValue: _hideUntil,
                  onChanged: (_) => setState(
                    () => _hideUntil = const Duration(days: 7),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await doRequest(
                context: context,
                request: GBeaconHideByIdReq(
                  (b) => b
                    ..vars.beacon_id = widget.beacon.id
                    ..vars.hidden_until = DateTime.timestamp().add(_hideUntil),
                ),
              );
              if (context.mounted) context.pop();
            },
            child: const Text('Apply'),
          ),
          TextButton(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
