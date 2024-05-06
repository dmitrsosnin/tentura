class SeedExistsException implements Exception {
  const SeedExistsException();
}

class SeedIsWrongException implements Exception {
  const SeedIsWrongException();
}

sealed class AuthenticationException implements Exception {
  const AuthenticationException([this.description]);

  final String? description;

  @override
  String toString() => description ?? super.toString();
}

final class AuthenticationHttpException extends AuthenticationException {
  const AuthenticationHttpException([
    super.description = 'General HTTP error.',
  ]);
}

final class AuthenticationFailedException extends AuthenticationException {
  const AuthenticationFailedException([
    super.description = 'Authorization failed. Wrong token',
  ]);
}

final class AuthenticationNotFoundException extends AuthenticationException {
  const AuthenticationNotFoundException([
    super.description = 'Authorization failed. User not found',
  ]);
}

final class AuthenticationDuplicatedException extends AuthenticationException {
  const AuthenticationDuplicatedException([
    super.description = 'Authorization failed. User registered already',
  ]);
}

final class AuthenticationServerException extends AuthenticationException {
  const AuthenticationServerException([
    super.description = 'Internal server error.',
  ]);
}
