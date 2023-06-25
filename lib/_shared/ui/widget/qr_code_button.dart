import 'package:flutter/material.dart';

class QrCodeButton extends StatelessWidget {
  const QrCodeButton({super.key});

  @override
  Widget build(BuildContext context) => const IconButton(
        onPressed: null,
        icon: Icon(Icons.qr_code_2_rounded),
      );
}
