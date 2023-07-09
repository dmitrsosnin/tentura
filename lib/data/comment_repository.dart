import 'package:get_it/get_it.dart';

import 'package:gravity/types.dart';
import 'package:gravity/entity/comment.dart';
import 'package:gravity/data/api_service.dart';

part 'comment_queries.dart';

class CommentRepository {
  final _apiService = GetIt.I<ApiService>();

  Future<List<Comment>> getMommentsByBeaconId(
    String beaconId, {
    bool useCache = true,
  }) async {
    final data = await _apiService.query(
      query: '',
      vars: {'beacon_id': beaconId},
      fetchPolicy: useCache ? FetchPolicy.cacheFirst : FetchPolicy.networkOnly,
    );
    return (data['comment'] as List)
        .map<Comment>((e) => Comment.fromJson(e as Json))
        .toList();
  }
}
