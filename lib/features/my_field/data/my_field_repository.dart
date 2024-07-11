import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';

import 'gql/_g/my_field_fetch.req.gql.dart';
import 'gql/_g/beacon_vote_by_id.req.gql.dart';

class MyFieldRepository {
  static const _label = 'MyField';

  MyFieldRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  late final _fetchRequest =
      GMyFieldFetchReq((r) => r.fetchPolicy = FetchPolicy.CacheAndNetwork);

  Stream<Iterable<Beacon>> get stream =>
      _remoteApiService.gqlClient.request(_fetchRequest).map((r) => r
          .dataOrThrow(label: _label)
          .my_field
          .map((r) => r.beacon! as Beacon));

  Future<void> fetch() =>
      _remoteApiService.gqlClient.addRequestToRequestController(_fetchRequest);

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
