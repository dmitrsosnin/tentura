import 'package:ferry/ferry.dart' as f;
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart' as hf;
import 'package:ferry_hive_store/ferry_hive_store.dart' as fh;

import 'package:gravity/types.dart';

export 'package:ferry/ferry.dart' show FetchPolicy;
export 'package:ferry_flutter/ferry_flutter.dart';

class ApiService {
  static const _apiEndpointUrl =
      'https://hasura.gravity.intersubjective.space/v1/graphql';

  Future<String?> Function()? getToken;

  late final GraphQLClient client;

  late final f.Client ferry;

  Future<ApiService> init() async {
    await initHiveForFlutter();
    client = GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      defaultPolicies: DefaultPolicies(
        query: Policies(),
        mutate: Policies(),
      ),
      link: AuthLink(
        getToken: () async =>
            getToken == null ? null : 'Bearer ${await getToken!()}',
      ).concat(HttpLink(_apiEndpointUrl)),
    );
    ferry = f.Client(
      link: AuthLink(
        getToken: () async =>
            getToken == null ? null : 'Bearer ${await getToken!()}',
      ).concat(HttpLink(_apiEndpointUrl)),
      cache: f.Cache(
        store: fh.HiveStore(
            // ignore: strict_raw_type
            await hf.Hive.openBox<Map>('graphql')),
      ),
    );
    return this;
  }

  Future<Json> query({
    required String query,
    Map<String, Object?> vars = const {},
    FetchPolicy fetchPolicy = FetchPolicy.cacheFirst,
  }) async {
    final result = await client.query(
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
    final result = await client.mutate(
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
