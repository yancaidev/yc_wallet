class SimpleException implements Exception {
  final String message;
  final Object? origin;

  SimpleException(this.message, this.origin);
}
