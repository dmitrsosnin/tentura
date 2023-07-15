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

  final String userId;
  final BoxFit boxFit;
  final double? size;

  const AvatarImage({
    this.userId = '',
    this.boxFit = BoxFit.cover,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) => userId.isEmpty
      ? placeholderImage
      : Container(
          width: size,
          height: size,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: CachedNetworkImage(
            placeholder: (context, url) => placeholderImage,
            imageUrl: firebaseStrorageBaseUrl + userId + _suffix,
          ),
        );
}
