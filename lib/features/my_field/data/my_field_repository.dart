import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';

import 'gql/_g/my_field_fetch.req.gql.dart';
import 'gql/_g/beacon_vote_by_id.req.gql.dart';

class MyFieldRepository {
  static const _label = 'MyField';

  MyFieldRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<Iterable<Beacon>> fetch({
    required String context,
  }) =>
      _remoteApiService.gqlClient
          .request(GMyFieldFetchReq((r) => r.vars.context = context))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r
                .dataOrThrow(label: _label)
                .my_field
                .nonNulls
                .map<Beacon>((e) => e.beacon! as Beacon),
          );

  Future<Beacon> vote({
    required String id,
    required int amount,
  }) =>
      _remoteApiService.gqlClient
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
