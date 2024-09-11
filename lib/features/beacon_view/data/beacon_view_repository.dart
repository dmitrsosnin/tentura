import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/comment.dart';

import 'gql/_g/beacon_fetch_by_id.req.gql.dart';
import 'gql/_g/comment_fetch_by_beacon_id.req.gql.dart';
import 'gql/_g/comment_fetch_by_id.req.gql.dart';
import 'gql/_g/comment_vote_by_id.req.gql.dart';
import 'gql/_g/comment_create.req.gql.dart';

@singleton
class BeaconViewRepository {
  static const _label = 'BeaconView';

  BeaconViewRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<Beacon> fetchBeaconById(String beaconId) => _remoteApiService
      .request(GBeaconFetchByIdReq((b) => b.vars.id = beaconId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: _label).beacon_by_pk! as Beacon,
      );

  Future<Iterable<Comment>> fetchCommentsByBeaconId(String beaconId) =>
      _remoteApiService
          .request(
              GCommentFetchByBeaconIdReq((b) => b.vars.beacon_id = beaconId))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r
                .dataOrThrow(label: _label)
                .comment
                .map<Comment>((r) => r as Comment),
          );

  Future<(Beacon, Comment)> fetchCommentById(String commentId) =>
      _remoteApiService
          .request(GCommentFetchByIdReq((b) => b.vars.id = commentId))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then((r) => r.dataOrThrow(label: _label).comment_by_pk!)
          .then((v) => (v.beacon as Beacon, v as Comment));

  Future<Comment> addComment({
    required String beaconId,
    required String text,
  }) =>
      _remoteApiService
          .request(GCommentCreateReq(
            (b) => b.vars
              ..beacon_id = beaconId
              ..content = text,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).insert_comment_one! as Comment,
          );

  Future<int> voteForComment({
    required String commentId,
    required int amount,
  }) =>
      _remoteApiService
          .request(GCommentVoteByIdReq(
            (b) => b
              ..vars.amount = amount
              ..vars.comment_id = commentId,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).insert_vote_comment_one!.amount,
          );
}
