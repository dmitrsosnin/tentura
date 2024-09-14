import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';

import 'gql/_g/beacon_fetch_pinned.req.gql.dart';
import 'gql/_g/beacon_pin_by_id.req.gql.dart';
import 'gql/_g/beacon_unpin_by_id.req.gql.dart';

@singleton
class FavoritesRepository {
  static const _label = 'Favorites';

  FavoritesRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  final _fetchRequest = GBeaconFetchPinnedReq();

  Future<Iterable<Beacon>> fetch() => _remoteApiService
      .request(_fetchRequest)
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r
            .dataOrThrow(label: _label)
            .beacon_pinned
            .map((r) => r.beacon as Beacon),
      );

  Future<Beacon> pin(String beaconId) => _remoteApiService
      .request(GBeaconPinByIdReq((b) => b.vars.beacon_id = beaconId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: _label).insert_beacon_pinned_one!.beacon
            as Beacon,
      );

  Future<Beacon> unpin({
    required String userId,
    required String beaconId,
  }) =>
      _remoteApiService
          .request(GBeaconUnpinByIdReq(
            (b) => b.vars
              ..user_id = userId
              ..beacon_id = beaconId,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r
                .dataOrThrow(label: _label)
                .delete_beacon_pinned_by_pk!
                .beacon as Beacon,
          );
}
