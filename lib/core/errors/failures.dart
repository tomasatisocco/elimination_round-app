import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.errorMessege});
  final String? errorMessege;
}

class  LoginFailure extends Failure {
  const LoginFailure({required String? errorMessege, String? errorMessage})
  : super(errorMessege: errorMessege);

  @override
  List<Object?> get props => [errorMessege];
}

class UserNotLoggedIn extends Failure {
  const UserNotLoggedIn({required String? errorMessege}) : super(errorMessege: errorMessege);

  @override
  List<Object?> get props => [errorMessege];
}

class LogoutFailure extends Failure {
  const LogoutFailure({required String? errorMessege}) : super(errorMessege: errorMessege);
  
  @override
  List<Object?> get props => [errorMessege];
}