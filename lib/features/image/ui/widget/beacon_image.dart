import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../data/image_repository.dart';

class BeaconImage extends StatelessWidget {
  static const _placeholderPath = 'assets/images/image-placeholder.jpg';

  final String beaconId;
  final String authorId;
  final double? height;
  final double? width;
  final BoxFit boxFit;

  const BeaconImage({
    required this.authorId,
    this.beaconId = '',
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final placeholder = Image.asset(
      _placeholderPath,
      height: height,
      width: width,
      fit: boxFit,
    );
    return beaconId.isEmpty || authorId.isEmpty
        ? placeholder
        : CachedNetworkImage(
            height: height,
            width: width,
            filterQuality: FilterQuality.high,
            placeholder: (context, url) => placeholder,
            errorWidget: (context, url, error) => placeholder,
            imageUrl: ImageRepository.getBeaconUrl(authorId, beaconId),
          );
  }
}
