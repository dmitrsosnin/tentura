import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  final BoxFit fit;
  final String asset;

  const PlaceholderImage({
    required this.asset,
    this.fit = BoxFit.cover,
    super.key,
  });

  const PlaceholderImage.avatar({
    super.key,
    this.fit = BoxFit.cover,
    this.asset = 'assets/images/avatar-placeholder.jpg',
  });

  const PlaceholderImage.beacon({
    super.key,
    this.fit = BoxFit.cover,
    this.asset = 'assets/images/image-placeholder.jpg',
  });

  @override
  Widget build(BuildContext context) => Image.asset(
        asset,
        fit: fit,
        key: Key(asset + fit.name),
      );
}
