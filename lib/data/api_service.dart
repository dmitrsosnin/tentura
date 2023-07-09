import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:gravity/types.dart';

export 'package:graphql_flutter/graphql_flutter.dart' show FetchPolicy;

class ApiService {
  Future<String?> Function()? getToken;

  late final GraphQLClient _client;

  Future<ApiService> init() async {
    await initHiveForFlutter();
    _client = GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: AuthLink(
        getToken: () async =>
            getToken == null ? null : 'Bearer ${await getToken!()}',
      ).concat(
        HttpLink('https://hasura.gravity.intersubjective.space/v1/graphql'),
      ),
    );
    return this;
  }

  Future<Json> query({
    required String query,
    Map<String, Object?> vars = const {},
    FetchPolicy fetchPolicy = FetchPolicy.cacheFirst,
  }) async {
    final result = await _client.query(
      QueryOptions(
        document: gql(query),
        variables: vars,
        fetchPolicy: fetchPolicy,
      ),
    );
    if (kDebugMode) {
      print(result.data);
      print(result.exception);
    }
    if (result.hasException) throw result.exception!;
    final data = result.data!;
    data['cache_status'] = result.source == QueryResultSource.cache;
    return result.data!;
  }

  Future<Json> mutate({
    required String query,
    Map<String, Object?> vars = const {},
  }) async {
    final result = await _client.mutate(
      MutationOptions(
        document: gql(query),
        variables: vars,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    if (kDebugMode) {
      print(result.data);
      print(result.exception);
    }
    if (result.hasException) throw result.exception!;
    return result.data!;
  }
}
