import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';

import 'gql/_g/beacon_fetch_pinned_by_user_id.req.gql.dart';
import 'gql/_g/beacon_pin_by_id.req.gql.dart';
import 'gql/_g/beacon_unpin_by_id.req.gql.dart';

class FavoritesRepository {
  static const _label = 'Favorites';

  FavoritesRepository({
    required this.userId,
    required this.remoteApiService,
  });

  final String userId;
  final RemoteApiService remoteApiService;

  late final _fetchRequest = GBeaconFetchPinnedByUserIdReq(
    (r) => r
      ..fetchPolicy = FetchPolicy.CacheAndNetwork
      ..vars.user_id = userId,
  );

  Stream<Iterable<Beacon>> get stream =>
      remoteApiService.gqlClient.request(_fetchRequest).map((r) => r
          .dataOrThrow(label: _label)
          .beacon_pinned
          .map((r) => r.beacon as Beacon));

  void refetch() =>
      remoteApiService.gqlClient.requestController.add(_fetchRequest);

  Future<Beacon> pin(String beaconId) => remoteApiService.gqlClient
      .request(GBeaconPinByIdReq((b) => b.vars.beacon_id = beaconId))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: _label).insert_beacon_pinned_one!.beacon
            as Beacon,
      );

  Future<Beacon> unpin(String beaconId) => remoteApiService.gqlClient
      .request(GBeaconUnpinByIdReq(
        (b) => b.vars
          ..user_id = userId
          ..beacon_id = beaconId,
      ))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: _label).delete_beacon_pinned_by_pk!.beacon
            as Beacon,
      );
}
