import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/app/router/root_router.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/dialog/qr_scan_dialog.dart';

@RoutePage()
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
  Widget build(BuildContext context) => Scaffold(
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

  void _goWithCode(String? code) {
    if (code == null || code.isEmpty) return;
    if (code.length != idLength) {
      showSnackBar(
        context,
        isError: true,
        text: 'Wrong code length!',
      );
    }
    switch (code[0]) {
      case 'U':
        context.pushRoute(ProfileViewRoute(id: code));

      case 'B':
        context.pushRoute(BeaconViewRoute(id: code));

      case 'C':
        context.pushRoute(BeaconViewRoute(id: code));

      default:
        showSnackBar(
          context,
          isError: true,
          text: 'Wrong code prefix!',
        );
    }
  }
}
