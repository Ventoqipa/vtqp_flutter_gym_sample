/// Technical failure raised by the auth data layer.
/// Presentation must translate this into a user-facing message.
class AuthException implements Exception {
  const AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}
