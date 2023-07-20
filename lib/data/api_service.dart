import 'package:ferry/ferry.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';

export 'package:ferry/ferry.dart' show FetchPolicy;
export 'package:ferry_flutter/ferry_flutter.dart';

class ApiService {
  late final Client client;

  Future<String?> Function()? getToken;

  Future<ApiService> init() async {
    await Hive.initFlutter();
    client = Client(
      link: HttpLink(
        'https://hasura.gravity.intersubjective.space/v1/graphql',
        defaultHeaders: {
          'Authorization': 'Bearer ${await getToken?.call()}',
        },
      ),
      // ignore: strict_raw_type
      cache: Cache(store: HiveStore(await Hive.openBox<Map>('graphql'))),
    );
    return this;
  }
}
