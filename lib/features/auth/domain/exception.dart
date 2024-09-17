sealed class AuthException implements Exception {
  const AuthException();
}

final class AuthExceptionUnknown extends AuthException {
  const AuthExceptionUnknown();
}
