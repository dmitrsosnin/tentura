import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:gravity/core/consts.dart';
import 'package:gravity/core/types.dart';

class ApiService {
  late final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: AuthLink(
      getToken: () async => _authToken,
    ).concat(HttpLink(apiUrl)),
  );

  String? _authToken;

  set authToken(String? token) =>
      _authToken = token == null ? null : 'Bearer $token';

  Future<Json> query({
    required String query,
    Map<String, Object?> vars = const {},
  }) async {
    final result = await client.query(QueryOptions(
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
    final result = await client.mutate(MutationOptions(
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
