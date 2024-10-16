import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';

import 'package:tentura/features/profile/domain/entity/profile.dart';

import '../gql/_g/friends_fetch.req.gql.dart';

@lazySingleton
class FriendsRemoteRepository {
  FriendsRemoteRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<Iterable<Profile>> fetch() => _remoteApiService
      .request(GFriendsFetchReq())
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label).vote_user)
      .then((r) => r.map((e) => Profile(
            id: e.user.id,
            title: e.user.title,
            hasAvatar: e.user.has_picture,
          )));

  static const _label = 'Friends';
}
