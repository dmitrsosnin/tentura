import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:gravity/_shared/consts.dart';
import 'package:gravity/user/entity/user.dart';

class AvatarImage extends StatelessWidget {
  static const _suffix = '%2Favatar$firebaseStrorageUrlSuffix';
  static const _placeholderPath = 'assets/images/avatar-placeholder.jpg';

  static final placeholderImage = Image.asset(
    _placeholderPath,
    fit: BoxFit.cover,
    key: const Key(_placeholderPath),
  );

  final User user;
  final BoxFit boxFit;
  final double? height;
  final double? width;

  const AvatarImage({
    required this.user,
    this.boxFit = BoxFit.cover,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => user.hasPicture
      ? CachedNetworkImage(
          imageUrl: '$firebaseStrorageBaseUrl${user.id}$_suffix',
          placeholder: (context, url) => placeholderImage,
          height: height,
          width: width,
        )
      : placeholderImage;
}
