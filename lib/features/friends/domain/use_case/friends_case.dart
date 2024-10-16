import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:tentura/features/profile/domain/entity/profile.dart';
import 'package:tentura/features/auth/data/repository/auth_repository.dart';
import 'package:tentura/features/like/data/repository/like_remote_repository.dart';

import '../../data/repository/friends_remote_repository.dart';

@lazySingleton
class FriendsCase {
  FriendsCase(
    this._authRepository,
    this._likeRemoteRepository,
    this._friendsRemoteRepository,
  );

  final AuthRepository _authRepository;

  final LikeRemoteRepository _likeRemoteRepository;

  final FriendsRemoteRepository _friendsRemoteRepository;

  Stream<String> get currentAccountChanges =>
      _authRepository.currentAccountChanges();

  Stream<Profile> get friendsChanges => _likeRemoteRepository.changes
      .where((e) => e.value is Profile)
      .map((e) => e.value as Profile);

  Future<Iterable<Profile>> fetch() => _friendsRemoteRepository.fetch();

  Future<void> addFriend(Profile user) =>
      _likeRemoteRepository.setLike(user, amount: 1);

  Future<void> removeFriend(Profile user) =>
      _likeRemoteRepository.setLike(user, amount: 0);
}
