part of 'beacon_repository.dart';

const _createBeacon = User.fragment +
    Beacon.fragment +
    r'''
mutation CreateBeacon($title: String!, $description: String!, $place: geography, $timerange: tstzrange, $has_picture: Boolean!) {
  insert_beacon_one(object: {title: $title, description: $description, place: $place, timerange: $timerange, has_picture: $has_picture}) {
    ...beaconFields
  }
}
''';

const _getBeaconsOf = User.fragment +
    Beacon.fragment +
    r'''
query GetBeaconsOf($user_id: String!) {
  beacon(where: {user_id: {_eq: $user_id}}, order_by: {created_at: desc}) {
    ...beaconFields
  }
}
''';

const _searchBeconById = User.fragment +
    Beacon.fragment +
    r'''
query SearchBeacon($startsWith: String!, $limit: Int = 10) {
  beacon(where: {id: {_like: $startsWith}}, limit: $limit) {
    ...beaconFields
  }
}
''';
