import 'package:tentura/data/gql/gql_client.dart';

import 'package:tentura/domain/entity/beacon.dart';

import 'gql/_g/beacon_fetch_pinned_by_user_id.req.gql.dart';
import 'gql/_g/beacon_pin_by_id.req.gql.dart';
import 'gql/_g/beacon_unpin_by_id.req.gql.dart';

class FavoritesRepository {
  static const _label = 'Favorites';

  FavoritesRepository({
    Client? gqlClient,
  }) : _gqlClient = gqlClient ?? GetIt.I<Client>();

  final Client _gqlClient;

  Future<Iterable<Beacon>> fetchPinned(String userId) => _gqlClient
      .request(GBeaconFetchPinnedByUserIdReq((r) => r.vars.user_id = userId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r
            .dataOrThrow(label: _label)
            .beacon_pinned
            .map((r) => r.beacon as Beacon),
      );

  Future<Beacon> pin(String id) => _gqlClient
      .request(GBeaconPinByIdReq((b) => b.vars.beacon_id = id))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: _label).insert_beacon_pinned_one! as Beacon,
      );

  Future<Beacon> unpin({
    required String userId,
    required String beaconId,
  }) =>
      _gqlClient
          .request(GBeaconUnpinByIdReq(
            (b) => b.vars
              ..user_id = userId
              ..beacon_id = beaconId,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).delete_beacon_pinned_by_pk!
                as Beacon,
          );
}
