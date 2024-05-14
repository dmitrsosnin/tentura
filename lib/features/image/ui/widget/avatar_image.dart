import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/use_case/image_get_url_case.dart';

class AvatarImage extends StatelessWidget {
  static const _placeholderPath = 'assets/images/avatar-placeholder.jpg';

  const AvatarImage({
    required this.size,
    required this.userId,
    this.boxFit = BoxFit.cover,
    this.getUrlCase = const ImageGetUrlCase(),
    super.key,
  });

  final ImageGetUrlCase getUrlCase;
  final String userId;
  final BoxFit boxFit;
  final double size;

  @override
  Widget build(BuildContext context) {
    final placeholder = Image.asset(
      _placeholderPath,
      height: size,
      width: size,
      fit: boxFit,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: userId.isEmpty
          ? placeholder
          : CachedNetworkImage(
              height: size,
              width: size,
              fit: boxFit,
              filterQuality: FilterQuality.high,
              placeholder: (context, url) => placeholder,
              errorWidget: (context, url, error) => placeholder,
              imageUrl: getUrlCase.getAvatarUrl(userId),
            ),
    );
  }
}
