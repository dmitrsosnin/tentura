import 'package:injectable/injectable.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/auth/data/repository/auth_repository.dart';
import 'package:tentura/features/like/data/repository/like_remote_repository.dart';

import '../../data/repository/liked_beacons_repository.dart';

@singleton
class LikedBeaconsCase {
  const LikedBeaconsCase({
    required AuthRepository authRepository,
    required LikeRemoteRepository likeRemoteRepository,
    required LikedBeaconsRepository likedBeaconsRepository,
  })  : _authRepository = authRepository,
        _likeRemoteRepository = likeRemoteRepository,
        _likedBeaconsRepository = likedBeaconsRepository;

  final AuthRepository _authRepository;

  final LikedBeaconsRepository _likedBeaconsRepository;

  final LikeRemoteRepository _likeRemoteRepository;

  Stream<Beacon> get likeChanges => _likeRemoteRepository.changes
      .where((e) => e.value is Beacon)
      .map((e) => e.value as Beacon);

  Stream<String> get currentAccountChanges =>
      _authRepository.currentAccountChanges();

  Future<Iterable<Beacon>> fetch(String contextName) =>
      _likedBeaconsRepository.fetch(contextName);
}
