import 'dart:typed_data';

import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/user.dart';

import 'gql/_g/user_delete_by_id.req.gql.dart';
import 'gql/_g/user_fetch_by_id.req.gql.dart';
import 'gql/_g/user_update.req.gql.dart';

class ProfileRepository {
  static const _label = 'Profile';

  const ProfileRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  String get userId => _remoteApiService.userId;

  Future<User> fetch() => _remoteApiService
      .request(GUserFetchByIdReq((b) => b.vars.id = _remoteApiService.userId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label).user_by_pk! as User);

  Future<User> update({
    required String title,
    required String description,
    required bool hasPicture,
  }) =>
      _remoteApiService
          .request(GUserUpdateReq((b) => b.vars
            ..id = _remoteApiService.userId
            ..title = title
            ..description = description
            ..has_picture = hasPicture))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then((r) => r.dataOrThrow(label: _label).update_user_by_pk! as User);

  Future<void> delete() => _remoteApiService
      .request(GUserDeleteByIdReq((b) => b.vars.id = _remoteApiService.userId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label));

  Future<void> putAvatarImage(Uint8List image) =>
      _remoteApiService.putAvatarImage(image);
}

/// For using hydrated ProfileCubit with no actions
class ProfileRepositoryDummy implements ProfileRepository {
  const ProfileRepositoryDummy();

  @override
  String get userId => throw UnimplementedError();

  @override
  RemoteApiService get _remoteApiService => throw UnimplementedError();

  @override
  Future<void> delete() => throw UnimplementedError();

  @override
  Future<User> fetch() => throw UnimplementedError();

  @override
  Future<void> putAvatarImage(Uint8List image) => throw UnimplementedError();

  @override
  Future<User> update({
    required String title,
    required String description,
    required bool hasPicture,
  }) =>
      throw UnimplementedError();
}
