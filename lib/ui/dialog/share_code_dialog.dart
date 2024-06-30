import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

class ShareCodeDialog extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    required String header,
    required Uri link,
  }) =>
      showDialog(
        context: context,
        builder: (context) => ShareCodeDialog(
          header: header,
          link: link.toString(),
        ),
      );

  final String header;
  final String link;

  const ShareCodeDialog({
    required this.header,
    required this.link,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AlertDialog.adaptive(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      titlePadding: paddingMediumA,
      contentPadding: paddingMediumA,

      // Header
      title: Text(
        header,
        maxLines: 1,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
      ),

      // QRCode
      content: QrImageView(
        data: header,
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

      // Buttons
      actions: [
        Builder(
          builder: (context) => TextButton(
            child: const Text('Share Link'),
            onPressed: () {
              final box = context.findRenderObject()! as RenderBox;
              Share.share(
                link,
                sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
              );
            },
          ),
        ),
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Close'),
        ),
      ],
    );
  }
}
