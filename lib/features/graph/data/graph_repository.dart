import 'package:tentura/data/gql/gql_client.dart';

import 'gql/_g/graph_fetch.data.gql.dart';
import 'gql/_g/graph_fetch.req.gql.dart';

class GraphRepository {
  static const _label = 'Graph';

  GraphRepository({
    required this.gqlClient,
  });

  final Client gqlClient;

  Future<GGraphFetchData_gravityGraph> fetch({
    required String focus,
    required bool positiveOnly,
    required int limit,
  }) =>
      gqlClient
          .request(GGraphFetchReq(
            (b) => b.vars
              ..focus = focus
              ..limit = limit
              ..positiveOnly = positiveOnly,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then((r) => r.dataOrThrow(label: _label).gravityGraph);
}
