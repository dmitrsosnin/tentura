import 'package:fresh_graphql/fresh_graphql.dart';

import 'package:tentura/features/auth/data/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  static const mockId = 'Ua42859384644';
  static const mockSeed = '4vegTLcjwnxNrMLS3BRFfe1p0lO6VgY5EPNuAcq5ssI=';

  @override
  Future<({String id, String seed})> signUp() async =>
      (id: mockId, seed: mockSeed);

  @override
  Future<String> signIn(String seed) async => mockId;

  @override
  Future<void> close() async {}

  @override
  Future<void> delete() async {}

  @override
  Future<void> signOut() async {}

  @override
  FreshLink<OAuth2Token> get link => throw UnimplementedError();
}
