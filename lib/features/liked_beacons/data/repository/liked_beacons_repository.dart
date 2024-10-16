import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/beacon/data/model/beacon_model.dart';

import '../gql/_g/liked_beacons_fetch.req.gql.dart';

@lazySingleton
class LikedBeaconsRepository {
  LikedBeaconsRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<Iterable<Beacon>> fetch(String contextName) => _remoteApiService
      .request(GLikedBeaconsFetchReq())
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label).vote_beacon.nonNulls)
      .then((v) => v.map((e) => (e.beacon as BeaconModel).toEntity));

  static const _label = 'Friends';
}
