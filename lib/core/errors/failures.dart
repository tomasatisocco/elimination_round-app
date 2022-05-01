import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.errorMessage});
  final String? errorMessage;
}

class LoginFailure extends Failure {
  const LoginFailure({required String? errorMessage})
      : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class UserNotLoggedIn extends Failure {
  const UserNotLoggedIn({required String? errorMessage})
      : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class LogoutFailure extends Failure {
  const LogoutFailure({required String? errorMessage})
      : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class LocalPersistenceFailure extends Failure {
  const LocalPersistenceFailure({required String? errorMessage})
      : super(errorMessage: errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
