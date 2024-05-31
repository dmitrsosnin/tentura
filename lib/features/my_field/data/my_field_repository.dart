import 'package:tentura/data/gql/gql_client.dart';

import 'package:tentura/domain/entity/beacon.dart';

import 'gql/_g/beacon_fetch_my_field.req.gql.dart';
import 'gql/_g/beacon_vote_by_id.req.gql.dart';

export 'package:tentura/data/gql/gql_client.dart';

class MyFieldRepository {
  static const _label = 'MyField';

  MyFieldRepository({
    required this.gqlClient,
  });

  final Client gqlClient;

  Future<Iterable<Beacon>> fetchFieldOf(String userId) => gqlClient
      .request(GBeaconFetchMyFieldReq())
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r
            .dataOrThrow(label: _label)
            .scores
            .where((r) => r.beacon != null)
            .map<Beacon>((r) => r.beacon! as Beacon),
      );

  Future<Beacon> vote({
    required String id,
    required int amount,
  }) =>
      gqlClient
          .request(GBeaconVoteByIdReq(
            (b) => b
              ..vars.amount = amount
              ..vars.beacon_id = id,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).insert_vote_beacon_one!.beacon
                as Beacon,
          );
}
