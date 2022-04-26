part of 'authentication_cubit.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

abstract class AuthenticationState extends Equatable {
  const AuthenticationState({required this.status});

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial() : super(status: AuthenticationStatus.unknown);

  @override
  List<Object> get props => [super.status];
}

class UnknownUser extends AuthenticationState {
  const UnknownUser() : super(status: AuthenticationStatus.unknown);

  @override
  List<Object> get props => [super.status];
}

class UnauthenticatedUser extends AuthenticationState {
  const UnauthenticatedUser()
      : super(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [super.status];
}

class AuthenticatedUser extends AuthenticationState {
  final AuthenticationUserModel userModel;
  const AuthenticatedUser({required this.userModel})
      : super(status: AuthenticationStatus.authenticated);

  @override
  List<Object> get props => [super.status, userModel];
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading() : super(status: AuthenticationStatus.unknown);

  @override
  List<Object> get props => [];
}
