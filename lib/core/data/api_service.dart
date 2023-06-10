import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:gravity/feature/auth/data/auth_controller.dart';

class ApiService {
  late final query = _client.query;
  late final mutate = _client.mutate;

  late final GraphQLClient _client;

  Future<ApiService> init() async {
    // await initHiveForFlutter();
    _client = GraphQLClient(
      cache: GraphQLCache(),
      // cache: GraphQLCache(store: HiveStore()),
      link: AuthLink(
        getToken: () async {
          final accessToken = await GetIt.I<AuthController>().getIdToken();
          return 'Bearer $accessToken';
        },
      ).concat(HttpLink(
        'https://hasura.gravity.intersubjective.space/v1/graphql',
      )),
    );
    return this;
  }
}
