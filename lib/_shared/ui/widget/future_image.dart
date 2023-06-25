import 'dart:typed_data';
import 'package:flutter/material.dart';

class FutureImage extends StatelessWidget {
  final Future<Uint8List?>? futureImage;
  final Widget placeholder;
  final BoxFit boxFit;

  const FutureImage({
    super.key,
    required this.futureImage,
    required this.placeholder,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: futureImage,
        builder: (context, snapshot) => snapshot.hasError
            ? const Icon(Icons.error_outline_outlined)
            : snapshot.hasData
                ? Image.memory(
                    snapshot.data!,
                    key: ObjectKey(key),
                    fit: boxFit,
                  )
                : placeholder,
      );
}
