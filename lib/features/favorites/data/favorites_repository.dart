import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';

import 'package:tentura/features/beacon/data/model/beacon_model.dart';
import 'package:tentura/features/beacon/domain/entity/beacon.dart';

import 'gql/_g/beacon_fetch_pinned.req.gql.dart';
import 'gql/_g/beacon_pin_by_id.req.gql.dart';
import 'gql/_g/beacon_unpin_by_id.req.gql.dart';

@singleton
class FavoritesRepository {
  static const _label = 'Favorites';

  FavoritesRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<Iterable<Beacon>> fetch() => _remoteApiService
      .request(GBeaconFetchPinnedReq())
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label).beacon_pinned)
      .then((v) => v.map((e) => (e.beacon as BeaconModel).toEntity));

  Future<String> pin(String beaconId) => _remoteApiService
      .request(GBeaconPinByIdReq((b) => b.vars.beacon_id = beaconId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label).insert_beacon_pinned_one)
      .then((r) => r?.beacon_id ?? beaconId);

  Future<String> unpin({
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
          .then((r) => r.dataOrThrow(label: _label).delete_beacon_pinned_by_pk)
          .then((r) => r?.beacon_id ?? beaconId);
}
