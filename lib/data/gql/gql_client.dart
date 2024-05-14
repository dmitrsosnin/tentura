import 'package:hive/hive.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';

import 'package:tentura/consts.dart';

Future<Client> buildGqlClient({
  required Link link,
  bool useCache = false,
  String serverName = appLinkBase,
}) async {
  if (useCache) {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
  }
  return Client(
    link: Link.from([
      link,
      HttpLink('https://$serverName/v1/graphql'),
    ]),
    cache: useCache
        ? Cache(
            store: HiveStore(
              await Hive.openBox<Map<String, dynamic>>('graphql_cache'),
            ),
          )
        : null,
    defaultFetchPolicies: {
      OperationType.query: FetchPolicy.NoCache,
    },
  );
}
