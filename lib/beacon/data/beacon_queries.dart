part of 'beacon_repository.dart';

const _createBeacon = User.fragment +
    Beacon.fragment +
    r'''
mutation CreateBeacon($title: String!, $description: String!, $place: geography, $place_name: String, $timerange: tstzrange, $has_picture: Boolean!) {
  insert_beacon_one(object: {title: $title, description: $description, place: $place, place_name: $place_name, timerange: $timerange, has_picture: $has_picture}) {
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
