import 'dart:io';
import 'package:hive/hive.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';

Future<Client> buildGqlClient({
  required String serverName,
  required FreshLink<OAuth2Token> authLink,
  Directory? storageDirectory,
}) async {
  final link = Link.from([
    authLink,
    HttpLink('https://$serverName/v1/graphql'),
  ]);
  if (storageDirectory == null) return Client(link: link);
  Hive.init(storageDirectory.path);
  final box = await Hive.openBox<Map<dynamic, dynamic>>('graphql_cache');
  return Client(
    link: link,
    cache: Cache(
      store: HiveStore(box),
    ),
    defaultFetchPolicies: {
      OperationType.query: FetchPolicy.NoCache,
    },
  );
}
