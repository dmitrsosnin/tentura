import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/user.dart';

import '../entity/user_rating.dart';
import 'gql/_g/fetch_users_rating.req.gql.dart';

class RatingRepository {
  static const _label = 'Rating';

  RatingRepository({
    required this.remoteApiService,
  });

  final RemoteApiService remoteApiService;

  Future<Iterable<UserRating>> fetchUsersRating() => remoteApiService.gqlClient
      .request(GUsersRatingReq())
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then(
        (r) => r.dataOrThrow(label: _label).usersStats.map((e) => UserRating(
              egoScore: e.egoScore,
              userScore: e.nodeScore,
              user: e.user! as User,
            )),
      );
}
