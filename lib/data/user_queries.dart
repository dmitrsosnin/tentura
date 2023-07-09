part of 'user_repository.dart';

const _createUser = User.fragment +
    r'''
mutation CreateUser {
  insert_user_one(object: {title: "", description: ""}) {
    ...userFields
  }
}
''';

const _updateUser = User.fragment +
    r'''
mutation UpdateUser($id: String!, $title: String!, $description: String!, $has_picture: Boolean!) {
  update_user_by_pk(pk_columns: {id: $id}, _set: {title: $title, description: $description, has_picture: $has_picture}) {
    ...userFields
  }
}
''';

const _fetchUserProfile = User.fragment +
    r'''
query FetchUserProfile($id: String!) {
  user_by_pk(id: $id) {
    ...userFields
  }
}
''';
