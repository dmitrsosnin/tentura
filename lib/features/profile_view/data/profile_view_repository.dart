import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/features/beacon/data/model/beacon_model.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';
import 'package:tentura/features/profile/domain/entity/profile.dart';
import 'package:tentura/features/user/data/model/user_model.dart';

import 'gql/_g/profile_fetch_by_user_id.req.gql.dart';

@lazySingleton
class ProfileViewRepository {
  static const _label = 'ProfileView';

  ProfileViewRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<({Profile profile, Iterable<Beacon> beacons})> fetchByUserId(
    String userId,
  ) =>
      _remoteApiService
          .request(GProfileFetchByUserIdReq((b) => b.vars.user_id = userId))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then((r) => r.dataOrThrow(label: _label).user_by_pk!)
          .then(
            (r) => (
              profile: (r as UserModel).toEntity,
              beacons: r.beacons.map((e) => (e as BeaconModel).toEntity),
            ),
          );
}
