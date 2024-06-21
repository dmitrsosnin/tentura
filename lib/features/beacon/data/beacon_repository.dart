import 'dart:typed_data';

import 'package:flutter/material.dart' show DateTimeRange;

import 'package:tentura/data/gql/_g/schema.schema.gql.dart';
import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/geo.dart';

import 'gql/_g/beacon_create.req.gql.dart';
import 'gql/_g/beacon_delete_by_id.req.gql.dart';
import 'gql/_g/beacon_update_by_id.req.gql.dart';
import 'gql/_g/beacons_fetch_by_user_id.req.gql.dart';

class BeaconRepository {
  static const _label = 'Beacon';

  BeaconRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  late final _fetchRequest = GBeaconsFetchByUserIdReq(
    (b) => b
      ..fetchPolicy = FetchPolicy.CacheAndNetwork
      ..vars.user_id = _remoteApiService.userId,
  );

  Stream<Iterable<Beacon>> get stream => _remoteApiService.gqlClient
      .request(_fetchRequest)
      .map((r) => r.dataOrThrow(label: _label).beacon.map((r) => r as Beacon));

  Future<void> fetch() =>
      _remoteApiService.gqlClient.addRequestToRequestController(_fetchRequest);

  Future<Beacon> create({
    required String title,
    bool hasPicture = false,
    String description = '',
    DateTimeRange? dateRange,
    Coordinates? coordinates,
  }) =>
      _remoteApiService.gqlClient
          .request(
            GBeaconCreateReq((b) => b.vars
              ..title = title
              ..description = description
              ..has_picture = hasPicture
              ..timerange = dateRange
              ..lat = coordinates == null
                  ? null
                  : (Gfloat8Builder()..value = coordinates.lat.toString())
              ..long = coordinates == null
                  ? null
                  : (Gfloat8Builder()..value = coordinates.long.toString())),
          )
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).insert_beacon_one! as Beacon,
          );

  Future<void> delete(String id) => _remoteApiService.gqlClient
      .request(GBeaconDeleteByIdReq((b) => b.vars.id = id))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label));

  Future<Beacon> setEnabled({
    required String id,
    required bool isEnabled,
  }) =>
      _remoteApiService.gqlClient
          .request(GBeaconUpdateByIdReq(
            (b) => b
              ..vars.id = id
              ..vars.enabled = isEnabled,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then((r) => r.dataOrThrow().update_beacon_by_pk! as Beacon);

  Future<void> putBeaconImage({
    required Uint8List image,
    required String beaconId,
  }) =>
      _remoteApiService.putBeaconImage(image, beaconId: beaconId);
}
