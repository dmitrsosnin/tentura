import 'dart:isolate';
import 'package:hive/hive.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';

import 'auth_link.dart';
import 'message.dart';

Future<Client> buildClient(
  ({String serverName, String? storagePath}) params,
  SendPort? sendPort,
) async {
  final receivePort = ReceivePort();
  sendPort!.send(InitMessage(receivePort.sendPort));
  final tokenStream = receivePort.asBroadcastStream();

  final link = Link.concat(
    AuthLink(() async {
      sendPort.send(GetTokenRequest());
      final response = await tokenStream
          .where((e) => e is GetTokenResponse)
          .first as GetTokenResponse;
      return response.value;
    }),
    HttpLink('https://${params.serverName}/v1/graphql'),
  );

  if (params.storagePath == null) {
    return Client(link: link);
  } else {
    Hive.init(params.storagePath);
  }

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
