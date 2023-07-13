import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:gravity/consts.dart';

class AvatarImage extends StatelessWidget {
  static const _suffix = '%2Favatar$firebaseStrorageUrlSuffix';
  static const _placeholderPath = 'assets/images/avatar-placeholder.jpg';

  static final placeholderImage = Image.asset(
    _placeholderPath,
    fit: BoxFit.cover,
    key: const Key(_placeholderPath),
  );

  final bool hasImage;
  final String userId;
  final BoxFit boxFit;
  final double? height;
  final double? width;

  const AvatarImage({
    this.hasImage = false,
    this.userId = '',
    this.boxFit = BoxFit.cover,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => hasImage
      ? Container(
          width: width,
          height: height,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: CachedNetworkImage(
            placeholder: (context, url) => placeholderImage,
            imageUrl: firebaseStrorageBaseUrl + userId + _suffix,
          ),
        )
      : placeholderImage;
}
