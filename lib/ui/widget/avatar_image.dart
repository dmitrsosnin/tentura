import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:gravity/data/image_repository.dart';

class AvatarImage extends StatelessWidget {
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
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: userId.isEmpty
            ? Image.asset(
                _placeholderPath,
                height: size,
                width: size,
                fit: boxFit,
              )
            : CachedNetworkImage(
                height: size,
                width: size,
                fit: boxFit,
                imageUrl: '${ImageRepository.baseUrl}$userId/avatar.jpg',
                placeholder: (context, url) => Image.asset(
                  _placeholderPath,
                  height: size,
                  width: size,
                  fit: boxFit,
                ),
              ),
      );
}
