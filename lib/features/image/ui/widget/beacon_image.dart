import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/use_case/image_get_url_case.dart';

class BeaconImage extends StatelessWidget {
  static const _placeholderPath = 'assets/images/image-placeholder.jpg';

  const BeaconImage({
    required this.authorId,
    this.beaconId = '',
    this.boxFit = BoxFit.cover,
    this.getUrlCase = const ImageGetUrlCase(),
    this.height,
    this.width,
    super.key,
  });

  final ImageGetUrlCase getUrlCase;
  final String beaconId;
  final String authorId;
  final double? height;
  final double? width;
  final BoxFit boxFit;

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
            imageUrl: getUrlCase.getBeaconUrl(authorId, beaconId),
          );
  }
}
