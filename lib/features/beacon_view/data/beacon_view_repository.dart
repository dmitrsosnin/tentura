import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/comment.dart';

import 'gql/_g/beacon_fetch_by_id.req.gql.dart';
import 'gql/_g/comment_create.req.gql.dart';
import 'gql/_g/comment_fetch_by_beacon_id.req.gql.dart';
import 'gql/_g/comment_vote_by_id.req.gql.dart';

class BeaconViewRepository {
  static const _label = 'Comment';

  BeaconViewRepository({
    required this.remoteApiService,
  });

  final RemoteApiService remoteApiService;

  Future<Beacon> fetchById(String beaconId) => remoteApiService
      .request(GBeaconFetchByIdReq((b) => b.vars.id = beaconId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: _label).beacon_by_pk! as Beacon,
      );

  Future<Iterable<Comment>> fetchByBeaconId(String beaconId) => remoteApiService
      .request(GCommentFetchByBeaconIdReq((b) => b.vars.beacon_id = beaconId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r
            .dataOrThrow(label: _label)
            .comment
            .map<Comment>((r) => r as Comment),
      );

  Future<Comment> addComment({
    required String beaconId,
    required String text,
  }) =>
      remoteApiService
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
      remoteApiService
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
