import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';

import 'package:gravity/image/data/image_repository.dart';

import 'package:gravity/user/entity/user.dart';

mixin class AvatarImageCase {
  static const _timeout = Duration(seconds: 3);

  final _imageRepository = GetIt.I<ImageRepository>();

  Future<Uint8List?> getAvatarImageOf(User user) async {
    if (user.isEmpty || user.hasNoPicture) return null;
    try {
      return await _imageRepository.getAvatarOf(user.id).timeout(_timeout);
    } on PlatformException catch (_) {
      // Not found
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> setAvatarImageOf(String userId, String path) async {
    await _imageRepository
        .putAvatar(
          userId: userId,
          image: await File(path).readAsBytes(),
        )
        .firstWhere((e) => e.isFinished);
    _imageRepository.evictAvatarOf(userId);
  }
}
