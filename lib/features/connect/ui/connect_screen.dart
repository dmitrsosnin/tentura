import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/dialog/qr_scan_dialog.dart';

class ConnectScreen extends StatefulWidget {
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
        minimum: paddingMediumA,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: paddingMediumA,
              child: Text(
                'If you have Code, please write it here',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: paddingMediumA,
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
              padding: paddingMediumA,
              child: FilledButton(
                child: const Text('Search'),
                onPressed: () => _goWithCode(_inputController.text),
              ),
            ),
            const Padding(
              padding: paddingMediumA,
              child: Text(
                'or',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: paddingMediumA,
              child: FilledButton(
                child: const Text('Scan QR'),
                onPressed: () async {
                  final code = await QRScanDialog.show(context);
                  if (context.mounted) _goWithCode(code);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goWithCode(String? code) {
    if (code == null || code.isEmpty) return;
    if (code.length == codeLength) {
      // TBD: server side
    } else if (code.length == idLength) {
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
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Not implemented yet...'),
          behavior: SnackBarBehavior.floating,
          margin: paddingMediumA,
          showCloseIcon: true,
        ));
      } else {
        showSnackBar(
          context,
          isError: true,
          text: 'Wrong code prefix!',
        );
      }
    } else {
      showSnackBar(
        context,
        isError: true,
        text: 'Wrong code length!',
      );
    }
  }
}
