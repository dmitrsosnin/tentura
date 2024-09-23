sealed class LikeException implements Exception {
  const LikeException([this.message]);

  final String? message;
}

final class LikeSetException extends LikeException {
  const LikeSetException([super.message]);
}

final class LikeWrongTypeException extends LikeException {
  const LikeWrongTypeException([super.message]);
}
