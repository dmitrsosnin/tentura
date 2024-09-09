import 'dart:async';

import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/domain/use_case/pick_image_case.dart';

import '../../data/repository/profile_local_repository.dart';
import '../../data/repository/profile_remote_repository.dart';

class ProfileCase with PickImageCase {
  ProfileCase({
    required ProfileLocalRepository profileLocalRepository,
    required ProfileRemoteRepository profileRemoteRepository,
  })  : _profileLocalRepository = profileLocalRepository,
        _profileRemoteRepository = profileRemoteRepository;

  final ProfileLocalRepository _profileLocalRepository;
  final ProfileRemoteRepository _profileRemoteRepository;

  Future<User> fetch(
    String id, {
    bool fromCache = true,
  }) async {
    final cached = await _profileLocalRepository.getProfileById(id);
    if (fromCache && cached != null) return cached;
    final profile = await _profileRemoteRepository.fetch(id);
    if (cached != profile) await _profileLocalRepository.setProfile(profile);
    return profile;
  }

  Future<User> update(User profile) async {
    await _profileRemoteRepository.update(profile);
    await _profileLocalRepository.setProfile(profile);
    return profile;
  }

  Future<String> delete() async {
    final id = await _profileRemoteRepository.delete();
    await _profileLocalRepository.deleteProfileById(id);
    return id;
  }

  Future<void> putAvatarImage(Uint8List image) =>
      _profileRemoteRepository.putAvatarImage(image);
}
