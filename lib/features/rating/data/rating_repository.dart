import 'package:tentura/data/gql/gql_client.dart';
import 'package:tentura/domain/entity/user.dart';

import '../entity/user_rating.dart';
import 'gql/_g/fetch_users_rating.req.gql.dart';

export 'package:tentura/data/gql/gql_client.dart';

class RatingRepository {
  static const _label = 'Rating';

  RatingRepository({
    required this.gqlClient,
  });

  final Client gqlClient;

  Future<Iterable<UserRating>> fetchUsersRating() => gqlClient
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
