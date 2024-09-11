import 'dart:typed_data';
import 'package:get_it/get_it.dart';

import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/data/service/remote_api_service.dart';

import 'gql/_g/beacon_create.req.gql.dart';
import 'gql/_g/beacon_delete_by_id.req.gql.dart';
import 'gql/_g/beacon_update_by_id.req.gql.dart';
import 'gql/_g/beacon_vote_by_id.req.gql.dart';
import 'gql/_g/beacons_fetch_by_user_id.req.gql.dart';

class BeaconRepository {
  static const _label = 'Beacon';

  BeaconRepository({RemoteApiService? remoteApiService})
      : _remoteApiService = remoteApiService ?? GetIt.I<RemoteApiService>();

  final RemoteApiService _remoteApiService;

  late final _fetchRequest = GBeaconsFetchByUserIdReq(
    (b) => b.vars.user_id = _remoteApiService.userId,
  );

  Stream<Iterable<Beacon>> get stream => _remoteApiService
      .request(_fetchRequest)
      .map((r) => r.dataOrThrow(label: _label).beacon.map((r) => r as Beacon));

  Future<void> fetch() =>
      _remoteApiService.addRequestToRequestController(_fetchRequest);

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
