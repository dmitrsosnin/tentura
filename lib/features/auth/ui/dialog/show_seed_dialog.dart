import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

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
    final seed = context.read<AuthCubit>().state.accounts[userId] ?? '';
    return AlertDialog.adaptive(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      titlePadding: paddingMediumA,
      contentPadding: paddingMediumA,

      // Header
      title: Text(
        userId,
        maxLines: 1,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
      ),

      // QRCode
      content: PrettyQrView.data(
        key: ValueKey(seed),
        data: seed,
        decoration: PrettyQrDecoration(
          shape: PrettyQrSmoothSymbol(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),

      // Buttons
      actions: [
        Builder(
          builder: (context) => TextButton(
            child: const Text('Copy to clipboard'),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: seed));
              if (context.mounted) {
                showSnackBar(
                  context,
                  text: 'Seed copied to clipboard!',
                );
              }
            },
          ),
        ),
        TextButton(
          onPressed: context.maybePop,
          child: const Text('Close'),
        ),
      ],
    );
  }
}
