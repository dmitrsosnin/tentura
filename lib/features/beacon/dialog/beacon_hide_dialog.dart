import 'package:tentura/app/router.dart';

import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

class BeaconHideDialog extends StatefulWidget {
  static Future<Duration?> show(BuildContext context) => showDialog<Duration?>(
        context: context,
        builder: (context) => const BeaconHideDialog(),
      );

  const BeaconHideDialog({super.key});

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
            onPressed: () => context.pop(_hideUntil),
            child: const Text('Apply'),
          ),
          TextButton(
            onPressed: context.pop,
            child: const Text('Cancel'),
          ),
        ],
      );
}
