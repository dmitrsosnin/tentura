import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/features/like/data/gql/_g/like_beacon_by_id.req.gql.dart';

@lazySingleton
class LikeRepository {
  static const _label = 'Like';

  LikeRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<int?> likeBeacon({
    required String id,
    required int amount,
  }) =>
      _remoteApiService
          .request(GLikeBeaconByIdReq(
            (b) => b
              ..vars.amount = amount
              ..vars.beacon_id = id,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).insert_vote_beacon_one?.amount,
          );
}
