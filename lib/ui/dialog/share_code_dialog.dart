import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import 'package:gravity/consts.dart';
import 'package:gravity/app/router.dart';
import 'package:gravity/ui/consts.dart';

class ShareCodeDialog extends StatelessWidget {
  static Future<void> show({
    required BuildContext context,
    required String id,
  }) =>
      showDialog<void>(
        context: context,
        builder: (context) => ShareCodeDialog(id: id),
      );

  final String id;

  const ShareCodeDialog({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Dialog(
      child: Padding(
        padding: paddingAll20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Short code
            Padding(
              padding: paddingAll20,
              child: Text(
                id,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            // QR Code
            QrImageView(
              data: id,
              backgroundColor: colorScheme.primaryContainer,
              dataModuleStyle: QrDataModuleStyle(
                color: colorScheme.onPrimaryContainer,
                dataModuleShape: QrDataModuleShape.square,
              ),
              eyeStyle: QrEyeStyle(
                color: colorScheme.onPrimaryContainer,
                eyeShape: QrEyeShape.square,
              ),
              size: MediaQuery.of(context).size.width / 2,
            ),
            // Share Button
            Padding(
              padding: paddingAll20,
              child: Builder(
                builder: (context) => FilledButton(
                  child: const Text('Share Link'),
                  onPressed: () {
                    final box = context.findRenderObject() as RenderBox;
                    Share.share(
                      Uri.https(
                        appLinkBase,
                        pathScanCode,
                        {'id': id},
                      ).toString(),
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
