import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:gravity/_shared/consts.dart';
import 'package:gravity/beacon/entity/beacon.dart';

class BeaconImage extends StatelessWidget {
  static const _placeholderPath = 'assets/images/image-placeholder.jpg';

  static final placeholderImage = Image.asset(
    _placeholderPath,
    fit: BoxFit.cover,
    key: const Key(_placeholderPath),
  );

  final Beacon beacon;
  final BoxFit boxFit;

  const BeaconImage({
    required this.beacon,
    this.boxFit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) => beacon.hasPicture
      ? CachedNetworkImage(
          imageUrl:
              '$firebaseStrorageBaseUrl${beacon.author.id}%2F${beacon.id}$firebaseStrorageUrlSuffix',
          placeholder: (context, url) => placeholderImage,
        )
      : placeholderImage;
}
