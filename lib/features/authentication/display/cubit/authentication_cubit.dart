import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/datasources/authentication_firebase_datasource.dart';
import '../../data/models/authentication_user_model.dart';
import '../../data/repositories/authentication_repository_implementation.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationInitial());

  final AuthenticationRepositoryImpl repository = AuthenticationRepositoryImpl(
      dataSource: AuthenticationFirebaseDataSourceImpl());

  void authenticationUserChanged() {
    emit(const AuthenticationLoading());
    final failureOrUserModel = repository.isLoggedIn();
    failureOrUserModel.fold(
      (failure) => emit(const UnknownUser()),
      (userModel) => emit(AuthenticatedUser(userModel: userModel)),
    );
  }

  void logOut() async {
    final failureOrLogout = await repository.logOut();
    failureOrLogout.fold(
      (failure) => null,
      (success) => emit(const UnauthenticatedUser()),
    );
  }
}
