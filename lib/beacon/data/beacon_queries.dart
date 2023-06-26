part of 'beacon_repository.dart';

const _createBeacon = r'''
mutation CreateBeacon($title: String!, $description: String!, $place: geography, $timerange: tstzrange, $has_picture: Boolean!) {
  insert_beacon_one(object: {title: $title, description: $description, place: $place, timerange: $timerange, has_picture: $has_picture}) {
    id
    title
    description
    created_at
    updated_at
    place
    timerange
    has_picture
    enabled
    author {
      id
      uid
      display_name
      description
      has_picture
    }
  }
}
''';

const _getBeaconsOf = r'''
query GetBeaconsOf($author_id: String!) {
  beacon(where: {author_id: {_eq: $author_id}}, order_by: {created_at: desc}) {
    id
    title
    description
    created_at
    updated_at
    place
    timerange
    has_picture
    enabled
    author {
      id
      uid
      display_name
      description
      has_picture
    }
  }
}
''';
