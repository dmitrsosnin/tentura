import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';

import 'gql/_g/like_beacon_by_id.req.gql.dart';
import 'gql/_g/like_comment_by_id.req.gql.dart';
import 'gql/_g/like_user_by_id.req.gql.dart';

@lazySingleton
class LikeRepository {
  static const _label = 'Like';

  LikeRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<int?> likeBeacon({
    required String beaconId,
    required int amount,
  }) =>
      _remoteApiService
          .request(GLikeBeaconByIdReq(
            (b) => b
              ..vars.amount = amount
              ..vars.beacon_id = beaconId,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).insert_vote_beacon_one?.amount,
          );

  Future<int?> likeComment({
    required String commentId,
    required int amount,
  }) =>
      _remoteApiService
          .request(GLikeCommentByIdReq(
            (b) => b
              ..vars.amount = amount
              ..vars.comment_id = commentId,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).insert_vote_comment_one?.amount,
          );

  Future<int?> likeUser({
    required String userId,
    required int amount,
  }) =>
      _remoteApiService
          .request(GLikeUserByIdReq(
            (b) => b.vars
              ..object = userId
              ..amount = amount,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).insert_vote_user_one?.amount,
          );
}
