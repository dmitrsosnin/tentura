import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/data/service/remote_api_service.dart';

import 'gql/_g/graph_fetch.data.gql.dart';
import 'gql/_g/graph_fetch.req.gql.dart';

class GraphRepository {
  static const _label = 'Graph';

  GraphRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<(Iterable<GGraphFetchData_graph>, Beacon?)> fetch({
    bool positiveOnly = true,
    String? context,
    String? focus,
    int offset = 0,
    int limit = 5,
  }) =>
      _remoteApiService.gqlClient
          .request(GGraphFetchReq(
            (b) => b.vars
              ..focus = focus
              ..limit = limit
              ..offset = offset
              ..context = context
              ..positive_only = positiveOnly,
          ))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then((r) => r.dataOrThrow(label: _label))
          .then((r) => (r.graph, r.beacon_by_pk as Beacon?));
}
