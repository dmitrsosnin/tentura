import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:gravity/data/image_repository.dart';

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
  Widget build(BuildContext context) => beaconId.isEmpty || authorId.isEmpty
      ? Image.asset(
          _placeholderPath,
          height: height,
          width: width,
          fit: boxFit,
        )
      : CachedNetworkImage(
          useOldImageOnUrlChange: true,
          height: height,
          width: width,
          imageUrl: '${ImageRepository.baseUrl}$authorId/$beaconId.jpg',
          placeholder: (context, url) => Image.asset(
            _placeholderPath,
            height: height,
            width: width,
            fit: boxFit,
          ),
        );
}
