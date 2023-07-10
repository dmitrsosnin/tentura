import 'package:get_it/get_it.dart';

import 'package:gravity/types.dart';
import 'package:gravity/entity/user.dart';
import 'package:gravity/data/api_service.dart';

import 'gql_queries.dart';

class UserRepository {
  final _apiService = GetIt.I<ApiService>();

  Future<User> createMyProfile() async {
    final data = await _apiService.mutate(query: mCreateUser);
    return User.fromJson(data['insert_user_one'] as Json);
  }

  Future<User> updateMyProfile({
    required String id,
    required String title,
    required String description,
    required bool hasPicture,
  }) async {
    final data = await _apiService.query(
      query: mUpdateUser,
      vars: {
        'id': id,
        'title': title,
        'description': description,
        'has_picture': hasPicture,
      },
    );
    if (data['update_user_by_pk'] == null) throw Exception('Can`t update');
    return User.fromJson(data['update_user_by_pk'] as Json);
  }

  Future<User?> getUserById(String userId) async {
    final data = await _apiService.query(
      query: qFetchUserProfile,
      vars: {'id': userId},
    );
    if (data['user_by_pk'] == null) return null;
    return User.fromJson(data['user_by_pk'] as Json);
  }
}
