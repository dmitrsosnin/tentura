import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:tentura/ui/utils/ui_consts.dart';

class AccountSeedDialog extends StatelessWidget {
  static Future<bool?> show(
    BuildContext context, {
    required String id,
    required String seed,
  }) =>
      showDialog<bool>(
        context: context,
        builder: (context) => AccountSeedDialog(id: id, seed: seed),
      );

  const AccountSeedDialog({
    required this.id,
    required this.seed,
    super.key,
  });

  final String id;
  final String seed;

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
          data: seed,
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
            child: const Text('Copy to clipboard'),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: seed));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Seed copied to clipboard!'),
                ));
              }
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
