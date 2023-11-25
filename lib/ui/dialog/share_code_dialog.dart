import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import 'package:tentura/ui/utils/ui_consts.dart';

class ShareCodeDialog extends StatelessWidget {
  final String id;
  final String link;

  const ShareCodeDialog({
    required this.id,
    required this.link,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AlertDialog.adaptive(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      titlePadding: paddingAll20,
      contentPadding: paddingAll20,
      title: Text(
        id,
        maxLines: 1,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      content: SizedBox.square(
        dimension: MediaQuery.of(context).size.width / 2,
        child: QrImageView(
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
        ),
      ),
      actions: [
        Builder(
          builder: (context) => TextButton(
            child: const Text('Share Link'),
            onPressed: () {
              final box = context.findRenderObject() as RenderBox;
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
