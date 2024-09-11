import 'dart:typed_data';
import 'package:injectable/injectable.dart';

import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/data/service/remote_api_service.dart';

import '../gql/_g/user_delete_by_id.req.gql.dart';
import '../gql/_g/user_fetch_by_id.req.gql.dart';
import '../gql/_g/user_update.req.gql.dart';

@singleton
class ProfileRemoteRepository {
  static const _label = 'Profile';

  const ProfileRemoteRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<User> fetch(String id) => _remoteApiService
      .request(GUserFetchByIdReq((b) => b.vars.id = id))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label).user_by_pk! as User);

  Future<User> update(User profile) => _remoteApiService
      .request(GUserUpdateReq((b) => b.vars
        ..id = _remoteApiService.userId
        ..title = profile.title
        ..description = profile.description
        ..has_picture = profile.has_picture))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label).update_user_by_pk! as User);

  Future<String> delete() => _remoteApiService
      .request(GUserDeleteByIdReq((b) => b.vars.id = _remoteApiService.userId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label))
      .then((r) => r.delete_user_by_pk!.id);

  Future<void> putAvatarImage(Uint8List image) =>
      _remoteApiService.putAvatarImage(image);
}
