import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:tentura/ui/utils/ui_utils.dart';

import '../bloc/auth_cubit.dart';

class ShowSeedDialog extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    required String userId,
  }) =>
      showDialog(
        context: context,
        builder: (context) => ShowSeedDialog(userId: userId),
      );

  const ShowSeedDialog({
    required this.userId,
    super.key,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final seed = context.read<AuthCubit>().state.accounts[userId]!;
    return AlertDialog.adaptive(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      titlePadding: paddingMediumA,
      contentPadding: paddingMediumA,
      title: Text(
        userId,
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
