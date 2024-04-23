import 'package:tentura/features/auth/data/auth_service.dart';

class AuthServiceMock implements AuthService {
  static const mockId = 'Uc1158424318a';
  static const mockSeed = 'seed';

  @override
  String get serverName => 'mock';

  @override
  Future<String> get accessToken async => '';

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
}
