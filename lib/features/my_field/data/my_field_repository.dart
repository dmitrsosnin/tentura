import 'package:tentura/data/service/remote_api_service.dart';
import 'package:tentura/domain/entity/beacon.dart';

import 'gql/_g/my_field_fetch.req.gql.dart';

class MyFieldRepository {
  static const _label = 'MyField';

  MyFieldRepository(this._remoteApiService);

  final RemoteApiService _remoteApiService;

  Future<Iterable<Beacon>> fetch({
    required String context,
  }) =>
      _remoteApiService.gqlClient
          .request(GMyFieldFetchReq((r) => r.vars.context = context))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then(
            (r) => r
                .dataOrThrow(label: _label)
                .my_field
                .nonNulls
                .map<Beacon>((e) => e.beacon! as Beacon),
          );
}
