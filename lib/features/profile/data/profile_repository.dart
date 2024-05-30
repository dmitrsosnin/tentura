import 'package:tentura/data/gql/gql_client.dart';

import '../../../domain/entity/user.dart';
import 'gql/_g/user_delete_by_id.req.gql.dart';
import 'gql/_g/user_fetch_by_id.req.gql.dart';
import 'gql/_g/user_update.req.gql.dart';

class ProfileRepository {
  static const _label = 'Profile';

  ProfileRepository({
    Client? gqlClient,
  }) : _gqlClient = gqlClient ?? GetIt.I<Client>();

  final Client _gqlClient;

  Future<User> fetchById(String id) => _gqlClient
      .request(GUserFetchByIdReq((b) => b.vars.id = id))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label).user_by_pk! as User);

  Future<User> update({
    required String id,
    required String title,
    required String description,
    required bool hasPicture,
  }) =>
      _gqlClient
          .request(GUserUpdateReq((b) => b.vars
            ..id = id
            ..title = title
            ..description = description
            ..has_picture = hasPicture))
          .firstWhere((e) => e.dataSource == DataSource.Link)
          .then((r) => r.dataOrThrow(label: _label).update_user_by_pk! as User);

  Future<void> deleteById(String id) => _gqlClient
      .request(GUserDeleteByIdReq((b) => b.vars.id = id))
      .firstWhere((e) => e.dataSource == DataSource.Link)
      .then((r) => r.dataOrThrow(label: _label));
}
