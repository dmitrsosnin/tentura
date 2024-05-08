import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/dialog/qr_scan_dialog.dart';

class ConnectScreen extends StatefulWidget {
  static GoRoute getRoute({GlobalKey<NavigatorState>? parentNavigatorKey}) =>
      GoRoute(
        path: pathHomeConnect,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const ConnectScreen(),
      );

  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  final _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: paddingAll20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: paddingAll20,
              child: Text(
                'If you have Code, please write it here',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: paddingAll20,
              child: TextFormField(
                controller: _inputController,
                decoration: const InputDecoration(
                  filled: true,
                ),
                maxLength: idLength,
                textAlign: TextAlign.center,
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                validator: (value) {
                  return null;
                },
              ),
            ),
            Padding(
              padding: paddingAll20,
              child: FilledButton(
                child: const Text('Search'),
                onPressed: () => _goWithCode(context, _inputController.text),
              ),
            ),
            const Padding(
              padding: paddingAll20,
              child: Text(
                'or',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: paddingAll20,
              child: FilledButton(
                child: const Text('Scan QR'),
                onPressed: () async {
                  final code = await QRScanDialog.show(context);
                  if (context.mounted) _goWithCode(context, code);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

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
      } else if (code.startsWith('C')) {
        // TBD
        ScaffoldMessenger.of(context).showSnackBar(notImplementedSnackBar);
      } else {
        final colorScheme = Theme.of(context).colorScheme;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Wrong code!',
            style: TextStyle(color: colorScheme.onErrorContainer),
          ),
          backgroundColor: colorScheme.errorContainer,
          behavior: SnackBarBehavior.floating,
          margin: paddingH20,
          showCloseIcon: true,
        ));
      }
    }
  }
}
