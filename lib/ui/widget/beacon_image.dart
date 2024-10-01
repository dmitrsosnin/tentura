import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:tentura/consts.dart';

class BeaconImage extends StatelessWidget {
  const BeaconImage({
    required this.authorId,
    this.beaconId = '',
    this.boxFit = BoxFit.cover,
    this.height,
    this.width,
    super.key,
  });

  final String beaconId;
  final String authorId;
  final double? height;
  final double? width;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    final placeholder = Image.asset(
      'assets/images/image-placeholder.jpg',
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
            imageUrl:
                '${kIsWeb ? '' : kAppLinkBase}/images/$authorId/$beaconId.jpg',
          );
  }
}
