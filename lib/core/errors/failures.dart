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