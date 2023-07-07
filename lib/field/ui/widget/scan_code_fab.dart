import 'package:flutter/material.dart';

class ScanCodeFAB extends StatelessWidget {
  final String heroTag;

  const ScanCodeFAB({
    required this.heroTag,
    super.key,
  });

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        heroTag: heroTag,
        child: const Icon(Icons.qr_code_scanner_rounded),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => const Scaffold(
              body: Center(child: Text('Scan window')),
            ),
          ),
        ),
      );
}
