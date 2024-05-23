import 'package:tentura/data/gql/gql_client.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';

import 'gql/_g/beacon_fetch_pinned_by_user_id.req.gql.dart';

class FavoritesRepository {
  FavoritesRepository({
    Client? gqlClient,
  }) : _gqlClient = gqlClient ?? GetIt.I<Client>();

  final Client _gqlClient;

  Future<Iterable<Beacon>> fetch(String userId) => _gqlClient
      .request(GBeaconFetchPinnedByUserIdReq((r) => r
        ..requestId = 'BeaconFetchPinned'
        ..vars.user_id = userId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: 'Beacon').beacon_pinned as Iterable<Beacon>,
      );
}
