import 'package:get_it/get_it.dart';

import 'package:gravity/_shared/types.dart';
import 'package:gravity/user/entity/user.dart';
import 'package:gravity/_shared/data/api_service.dart';

class UserRepository {
  final _apiService = GetIt.I<ApiService>();

  Future<User> createMyProfile({
    String displayName = '',
    String description = '',
    String photoUrl = '',
  }) async {
    final data = await _apiService.mutate(
      query: createUserMutation,
      vars: {
        'display_name': displayName,
        'description': description,
        'photo_url': photoUrl,
      },
    );
    return User.fromJson(data['insert_user_one'] as Json);
  }

  Future<User> getUserById(String userId) async {
    final data = await _apiService.query(
      query: fetchUserProfile,
      vars: {'id': userId},
    );
    if (data['user_by_pk'] == null) throw const UserNotFoundException();
    return User.fromJson(data['user_by_pk'] as Json);
  }
}

class UserNotFoundException implements Exception {
  const UserNotFoundException();
}

const createUserMutation = r'''
mutation CreateUser($display_name: String = "", $description: String = "", $photo_url: String = "") {
  insert_user_one(object: {display_name: $display_name, photo_url: $photo_url, description: $description}) {
    id
    uid
    display_name
    description
    photo_url
  }
}
''';

const fetchUserProfile = r'''
query FetchUserProfile($id: String!) {
  user_by_pk(id: $id) {
    id
    uid
    display_name
    description
    photo_url
  }
}
''';
