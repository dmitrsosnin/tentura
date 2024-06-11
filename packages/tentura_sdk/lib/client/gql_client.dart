import 'dart:isolate';
import 'package:hive/hive.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';

import 'auth_link.dart';

Future<Client> buildClient(
  ({String serverName, String? storagePath}) params,
  SendPort? sendPort,
) async {
  final link = Link.concat(
    AuthLink(() async {
      final port = ReceivePort();
      sendPort!.send(GetTokenMessage(port.sendPort));
      return await port.first.whenComplete(port.close) as String?;
    }),
    HttpLink('https://${params.serverName}/v1/graphql'),
  );

  if (params.storagePath == null) return Client(link: link);

  Hive.init(params.storagePath);
  return Client(
    link: link,
    cache: Cache(
      store: HiveStore(
        await Hive.openBox<Map<dynamic, dynamic>>('graphql_cache'),
      ),
    ),
    defaultFetchPolicies: {
      OperationType.query: FetchPolicy.NoCache,
    },
  );
}

class GetTokenMessage {
  const GetTokenMessage(this.replyPort);

  final SendPort replyPort;
}
