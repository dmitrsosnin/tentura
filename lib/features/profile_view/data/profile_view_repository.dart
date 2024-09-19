import 'package:injectable/injectable.dart';

import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';

import 'package:tentura/features/profile/domain/entity/profile.dart';

import 'gql/_g/profile_fetch_by_user_id.req.gql.dart';
import 'gql/_g/user_vote_by_id.req.gql.dart';

@singleton
class ProfileViewRepository {
  static const _label = 'ProfileView';

  ProfileViewRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<({Profile profile, List<Beacon> beacons})> fetchById(String userId) =>
      _remoteApiService
          .request(GProfileFetchByUserIdReq((b) => b.vars.user_id = userId))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then((r) => r.dataOrThrow(label: _label).user_by_pk!)
          .then(
        (r) {
          return (
            profile: Profile(
              id: r.id,
              title: r.title,
              description: r.description,
              hasAvatar: r.has_picture,
              myVote: r.my_vote ?? 0,
              score: double.tryParse(r.score?.value ?? '') ?? 0,
            ),
            beacons: r.beacons.map((r) => r as Beacon).toList(),
          );
        },
      );

  Future<int?> voteById({
    required String userId,
    required int amount,
  }) =>
      _remoteApiService
          .request(GUserVoteByIdReq(
            (b) => b.vars
              ..object = userId
              ..amount = amount,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r.dataOrThrow(label: _label).insert_vote_user_one?.amount,
          );
}
