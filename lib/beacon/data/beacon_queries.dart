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
query GetBeaconsOf($author_id: String!) {
  beacon(where: {author_id: {_eq: $author_id}}, order_by: {created_at: desc}) {
    ...beaconFields
  }
}
''';
