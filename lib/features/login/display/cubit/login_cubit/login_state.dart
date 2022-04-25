part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;

  bool get isFormValid => isEmailValid && isPasswordValid;

  const LoginState({
    required this.isEmailValid,
    required this.isPasswordValid,
  });

  @override
  String toString() {
    return '''Login State {
      is Email Valid: $isEmailValid
      is Password Valid: $isPasswordValid
    }''';
  }

  @override
  List<Object> get props =>
      [isEmailValid, isPasswordValid];
}

class UpdateLogin extends LoginState {
  const UpdateLogin(
      {required bool isEmailValid, required bool isPasswordValid})
      : super(
          isEmailValid: isEmailValid,
          isPasswordValid: isPasswordValid,
        );

  @override
  List<Object> get props =>
      [isEmailValid, isPasswordValid];
}

class EmptyLogin extends LoginState {
  const EmptyLogin()
      : super(
          isEmailValid: false,
          isPasswordValid: false,
        );

  @override
  List<Object> get props =>
      [isEmailValid, isPasswordValid];
}

class LoadingLogin extends LoginState {
  const LoadingLogin()
      : super(
          isEmailValid: true,
          isPasswordValid: true,
        );

  @override
  List<Object> get props =>
      [isEmailValid, isPasswordValid];
}

class FailLogin extends LoginState {
  const FailLogin({required this.error})
      : super(
          isEmailValid: true,
          isPasswordValid: true,
        );

  final String error;

  @override
  List<Object> get props =>
      [isEmailValid, isPasswordValid, error];
}

class SuccessLogin extends LoginState {
  const SuccessLogin()
      : super(
          isEmailValid: true,
          isPasswordValid: true,
        );

  @override
  List<Object> get props =>
      [isEmailValid, isPasswordValid];
}