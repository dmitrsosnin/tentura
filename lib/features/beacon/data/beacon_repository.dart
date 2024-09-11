import 'dart:typed_data';
import 'package:injectable/injectable.dart';

import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/data/service/remote_api_service.dart';

import 'gql/_g/beacon_create.req.gql.dart';
import 'gql/_g/beacon_delete_by_id.req.gql.dart';
import 'gql/_g/beacon_update_by_id.req.gql.dart';
import 'gql/_g/beacon_vote_by_id.req.gql.dart';
import 'gql/_g/beacons_fetch_by_user_id.req.gql.dart';

@singleton
class BeaconRepository {
  static const _label = 'Beacon';

  BeaconRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<Iterable<Beacon>> fetch(String userId) => _remoteApiService
      .request(GBeaconsFetchByUserIdReq((b) => b.vars.user_id = userId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label).beacon.map((e) => e as Beacon));

  Future<Beacon> create(Beacon beacon) => _remoteApiService
      .request(
        GBeaconCreateReq((b) => b.vars
          ..title = beacon.title
          ..description = beacon.description
          ..has_picture = beacon.has_picture
          ..timerange = beacon.timerange
          ..context = beacon.context
          ..lat = beacon.lat?.toBuilder()
          ..long = beacon.long?.toBuilder()),
      )
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: _label).insert_beacon_one! as Beacon,
      );

  Future<void> delete(String id) => _remoteApiService
      .request(GBeaconDeleteByIdReq((b) => b.vars.id = id))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label));

  Future<Beacon> setEnabled({
    required String id,
    required bool isEnabled,
  }) =>
      _remoteApiService
          .request(GBeaconUpdateByIdReq(
            (b) => b
              ..vars.id = id
              ..vars.enabled = isEnabled,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then((r) => r.dataOrThrow().update_beacon_by_pk! as Beacon);

  Future<Beacon> vote({
    required String id,
    required int amount,
  }) =>
      _remoteApiService
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

  Future<void> putBeaconImage({
    required Uint8List image,
    required String beaconId,
  }) =>
      _remoteApiService.putBeaconImage(image, beaconId: beaconId);
}
