import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:gravity/consts.dart';
import 'package:gravity/app/router.dart';
import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/dialog/qr_scan_dialog.dart';

class MyFieldPopupMenuButton extends StatelessWidget {
  const MyFieldPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) => PopupMenuButton(
        itemBuilder: (context) => <PopupMenuEntry<void>>[
          PopupMenuItem<void>(
            child: const Text('Input Code'),
            onTap: () async {
              final code = await showDialog<String?>(
                context: context,
                builder: (context) => AlertDialog.adaptive(
                  actions: [
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text('Close'),
                    ),
                  ],
                  // title: const Text('Enter code'),
                  contentPadding: paddingAll20,
                  content: TextField(
                    decoration: const InputDecoration(hintText: 'Input a Code'),
                    maxLength: idLength,
                    onChanged: (value) {
                      if (value.length == idLength) {
                        Navigator.of(context).pop(value);
                      }
                    },
                  ),
                ),
              );
              if (context.mounted) _goWithCode(context, code);
            },
          ),
          // Scan QR Code
          PopupMenuItem<void>(
            child: const Text('Scan QR'),
            onTap: () async {
              final code = await QRScanDialog.show(context);
              if (context.mounted) _goWithCode(context, code);
            },
          ),
          // Full Text Search?
          PopupMenuItem<void>(
            child: const Text('Search'),
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(notImplementedSnackBar);
            },
          ),
        ],
      );

  void _goWithCode(BuildContext context, String? code) {
    if (code != null && code.length == idLength) {
      if (kDebugMode) print(code);
      if (code.startsWith('B')) {
        context.push(Uri(
          path: pathBeaconView,
          queryParameters: {'id': code},
        ).toString());
      } else if (code.startsWith('U')) {
        context.push(Uri(
          path: pathProfileView,
          queryParameters: {'id': code},
        ).toString());
      } else if (code.startsWith('U')) {
        // TBD
        ScaffoldMessenger.of(context).showSnackBar(notImplementedSnackBar);
      }
    }
  }
}
