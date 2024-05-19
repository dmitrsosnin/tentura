import 'package:tentura/data/gql/gql_client.dart';
import 'package:tentura/domain/entity/lat_long.dart';
import 'package:tentura/domain/entity/date_time_range.dart';

import '../domain/entity/beacon.dart';
import 'gql/_g/beacon_create.req.gql.dart';
import 'gql/_g/beacons_fetch_by_user_id.req.gql.dart';

export '../domain/entity/beacon.dart';

class BeaconRepository {
  BeaconRepository({Client? gqlClient})
      : _gqlClient = gqlClient ?? GetIt.I<Client>();

  final Client _gqlClient;

  Future<List<Beacon>> fetchByUserId(String userId) => _gqlClient
      .request(
        GBeaconsFetchByUserIdReq((b) => b.vars.user_id = userId),
      )
      .firstWhere(
        (e) => e.dataSource == DataSource.Link,
      )
      .then(
        (r) => r.dataOrThrow().beacon.asList() as List<Beacon>,
      );

  Future<Beacon> create({
    required String title,
    bool hasPicture = false,
    String description = '',
    DateTimeRange? dateRange,
    LatLng? coordinates,
  }) =>
      _gqlClient
          .request(
            GBeaconCreateReq(
              (b) => b.vars
                ..title = title
                ..description = description
                ..has_picture = hasPicture
                ..timerange = dateRange
                ..place = coordinates,
            ),
          )
          .firstWhere(
            (e) => e.dataSource == DataSource.Link,
          )
          .then(
            (r) => r.dataOrThrow(label: 'Beacon').insert_beacon_one as Beacon,
          );
}
