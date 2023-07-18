import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:gravity/consts.dart';

class AvatarImage extends StatelessWidget {
  static const _suffix = '%2Favatar$firebaseStrorageUrlSuffix';
  static const _placeholderPath = 'assets/images/avatar-placeholder.jpg';

  final String userId;
  final BoxFit boxFit;
  final double size;

  const AvatarImage({
    required this.size,
    this.userId = '',
    this.boxFit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final placeholder = Image.asset(
      _placeholderPath,
      key: const Key(_placeholderPath),
      height: size,
      width: size,
      fit: boxFit,
    );
    return userId.isEmpty
        ? placeholder
        : Container(
            width: size,
            height: size,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: CachedNetworkImage(
              fit: boxFit,
              placeholder: (context, url) => placeholder,
              imageUrl: firebaseStrorageBaseUrl + userId + _suffix,
            ),
          );
  }
}
