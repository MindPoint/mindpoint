class LoginException implements Exception {
  final String? message;

  const LoginException(
      {this.message = 'Something went wrong when trying to login'});

  @override
  String toString() =>
      'An exception was thrown when trying to login the user { message: $message }';
}

class LogoutException implements Exception {
  final String? message;

  const LogoutException(
      {this.message = 'Something went wrong when trying to logout'});

  @override
  String toString() =>
      'An exception was thrown when trying to logout the user { message: $message }';
}
