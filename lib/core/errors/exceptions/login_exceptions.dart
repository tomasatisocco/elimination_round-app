class LoginException implements Exception {}
class InvalidEmailException extends LoginException {}
class PasswordExceptions extends LoginException {}
class UserNotFoundException extends LoginException {}
class UserDisabledException extends LoginException {}
class TooManyRequestException extends LoginException {}
class UncknownLoginException extends LoginException {}