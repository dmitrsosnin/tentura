import 'package:hive/hive.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';

import 'package:tentura/consts.dart';

export 'package:ferry/ferry.dart';
export 'package:get_it/get_it.dart';

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

extension ErrorHandler<TData, TVars> on OperationResponse<TData, TVars> {
  bool get hasNoErrors => !hasErrors;

  OperationResponse<TData, TVars> throwIfError({
    bool failOnNull = true,
    String? label,
  }) {
    if (hasErrors) {
      throw GraphQLException(
        error: linkException ?? graphqlErrors,
        label: label,
      );
    }
    if (failOnNull && data == null) {
      throw GraphQLNoDataException(label: label);
    }
    return this;
  }

  TData dataOrThrow({String? label}) => throwIfError(label: label).data!;
}

class GraphQLException implements Exception {
  const GraphQLException({
    this.label = 'No label',
    this.error = 'Unknown error on OperationRequest',
  });

  final Object? error;
  final String? label;

  @override
  String toString() => '$label: $error';
}

class GraphQLNoDataException implements Exception {
  const GraphQLNoDataException({
    this.label = 'No label',
  });

  final String? label;

  @override
  String toString() => '$label: OperationResponse has no data';
}
