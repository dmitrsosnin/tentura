import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/user.dart';

import '../domain/entity/user_rating.dart';
import 'gql/_g/rating_fetch.req.gql.dart';

class RatingRepository {
  static const _label = 'Rating';

  RatingRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<Iterable<UserRating>> fetch({
    required String context,
  }) =>
      _remoteApiService.gqlClient
          .request(GRatingFetchReq((r) => r.vars.context = context))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r
                .dataOrThrow(label: _label)
                .rating
                // TBD: remove filter when server will filter
                .where((e) => e.user?.id != _remoteApiService.userId)
                .map((e) => UserRating(
                      egoScore: double.parse(e.src_score!.value),
                      userScore: double.parse(e.dst_score!.value),
                      user: e.user! as User,
                    )),
          );
}
