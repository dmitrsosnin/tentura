import 'package:flutter/material.dart';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';

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
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(notImplementedSnackBar);
                },
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
