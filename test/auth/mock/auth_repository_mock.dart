import 'package:fresh_graphql/fresh_graphql.dart';

import 'package:tentura/features/auth/data/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  static const mockId = 'Ua42859384644';
  static const mockSeed = '4vegTLcjwnxNrMLS3BRFfe1p0lO6VgY5EPNuAcq5ssI=';

  @override
  String get serverName => 'Mock';

  @override
  FreshLink<OAuth2Token> get link => FreshLink.oAuth2(
        tokenStorage: InMemoryTokenStorage(),
        refreshToken: (token, __) async => null,
        shouldRefresh: (_) => false,
      );

  @override
  Future<({String id, String seed})> signUp() async =>
      (id: mockId, seed: mockSeed);

  @override
  Future<String> signIn(String seed) async => mockId;

  @override
  Future<void> dispose() async {}

  @override
  Future<void> delete() async {}

  @override
  Future<void> signOut() async {}
}
