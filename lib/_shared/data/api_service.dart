import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:gravity/_shared/consts.dart';
import 'package:gravity/_shared/types.dart';

class ApiService {
  Future<String?> Function()? getToken;

  late final _client = GraphQLClient(
    cache: GraphQLCache(),
    link: AuthLink(
      getToken: () async =>
          getToken == null ? null : 'Bearer ${await getToken!()}',
    ).concat(HttpLink(apiUrl)),
  );

  Future<Json> query({
    required String query,
    Map<String, Object?> vars = const {},
  }) async {
    final result = await _client.query(QueryOptions(
      document: gql(query),
      variables: vars,
      fetchPolicy: FetchPolicy.networkOnly,
    ));
    if (kDebugMode) {
      print(result.data);
      print(result.exception);
    }
    if (result.hasException) throw result.exception!;
    return result.data!;
  }

  Future<Json> mutate({
    required String query,
    Map<String, Object?> vars = const {},
  }) async {
    final result = await _client.mutate(MutationOptions(
      document: gql(query),
      variables: vars,
      fetchPolicy: FetchPolicy.networkOnly,
    ));
    if (kDebugMode) {
      print(result.data);
      print(result.exception);
    }
    if (result.hasException) throw result.exception!;
    return result.data!;
  }
}
