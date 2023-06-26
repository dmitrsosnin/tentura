import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';

import 'package:gravity/beacon/entity/beacon.dart';
import 'package:gravity/image/data/image_repository.dart';

mixin class BeaconImageCase {
  static const _timeout = Duration(seconds: 3);

  final _imageRepository = GetIt.I<ImageRepository>();

  Future<Uint8List?> getBeaconImageOf(Beacon beacon) async {
    if (beacon.hasNoPicture) return null;
    try {
      return await _imageRepository
          .getBeaconOf(beacon.author.id, beacon.id)
          .timeout(_timeout);
    } on PlatformException catch (_) {
      // Not found
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> setBeaconImageOf(Beacon beacon, String path) async {
    if (path.isEmpty || beacon.hasNoPicture) return;
    await _imageRepository
        .putBeacon(
          userId: beacon.author.id,
          beaconId: beacon.id,
          image: await File(path).readAsBytes(),
        )
        .firstWhere((e) => e.isFinished);
  }
}
