import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:gravity/consts.dart';

class BeaconImage extends StatelessWidget {
  static const _placeholderPath = 'assets/images/image-placeholder.jpg';

  static final placeholderImage = Image.asset(
    _placeholderPath,
    fit: BoxFit.cover,
    key: const Key(_placeholderPath),
  );

  final String beaconId;
  final String authorId;
  final BoxFit boxFit;

  const BeaconImage({
    required this.authorId,
    this.beaconId = '',
    this.boxFit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) => beaconId.isEmpty || authorId.isEmpty
      ? placeholderImage
      : CachedNetworkImage(
          imageUrl:
              '$firebaseStrorageBaseUrl$authorId%2F$beaconId$firebaseStrorageUrlSuffix',
          placeholder: (context, url) => placeholderImage,
          useOldImageOnUrlChange: true,
        );
}
