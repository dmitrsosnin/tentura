import 'package:gravity/entity/user.dart';
import 'package:gravity/entity/beacon.dart';

// User
const mCreateUser = User.fragment +
    r'''
mutation CreateUser {
  insert_user_one(object: {title: "", description: ""}) {
    ...userFields
  }
}
''';

const mUpdateUser = User.fragment +
    r'''
mutation UpdateUser($id: String!, $title: String!, $description: String!, $has_picture: Boolean!) {
  update_user_by_pk(pk_columns: {id: $id}, _set: {title: $title, description: $description, has_picture: $has_picture}) {
    ...userFields
  }
}
''';

const qFetchUserProfile = User.fragment +
    r'''
query FetchUserProfile($id: String!) {
  user_by_pk(id: $id) {
    ...userFields
  }
}
''';

// Beacon
const mCreateBeacon = User.fragment +
    Beacon.fragment +
    r'''
mutation CreateBeacon($title: String!, $description: String!, $place: geography, $timerange: tstzrange, $has_picture: Boolean!) {
  insert_beacon_one(object: {title: $title, description: $description, place: $place, timerange: $timerange, has_picture: $has_picture}) {
    ...beaconFields
  }
}
''';

const qSearchBeconById = User.fragment +
    Beacon.fragment +
    r'''
query SearchBeacon($startsWith: String!, $limit: Int = 10) {
  beacon(where: {id: {_like: $startsWith}}, limit: $limit) {
    ...beaconFields
  }
}
''';
