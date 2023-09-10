import 'package:ferry/ferry.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';

Future<Client> getGQLClient(Link authLink) async {
  await Hive.initFlutter();
  return Client(
    cache: Cache(
      store: HiveStore(await Hive.openBox('graphql')),
    ),
    // defaultFetchPolicies: {
    //   OperationType.query: FetchPolicy.CacheAndNetwork,
    // },
    link: Link.from([
      authLink,
      HttpLink('https://hasura.gravity.intersubjective.space/v1/graphql'),
    ]),
  );
}
