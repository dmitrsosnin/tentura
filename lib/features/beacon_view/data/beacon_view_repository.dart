import 'package:tentura/data/gql/gql_client.dart';
import 'package:tentura/domain/entity/comment.dart';

import 'package:tentura/domain/entity/beacon.dart';

import 'gql/_g/beacon_fetch_by_id.req.gql.dart';
import 'gql/_g/comment_create.req.gql.dart';
import 'gql/_g/comment_fetch_by_beacon_id.req.gql.dart';
import 'gql/_g/comment_vote_by_id.req.gql.dart';

class BeaconViewRepository {
  static const _label = 'Comment';

  BeaconViewRepository({
    Client? gqlClient,
  }) : _gqlClient = gqlClient ?? GetIt.I<Client>();

  final Client _gqlClient;

  Future<Beacon> fetchById(String beaconId) => _gqlClient
      .request(GBeaconFetchByIdReq((b) => b.vars.id = beaconId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: _label).beacon_by_pk! as Beacon,
      );

  Future<Iterable<Comment>> fetchByBeaconId(String beaconId) => _gqlClient
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
      _gqlClient
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
      _gqlClient
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
