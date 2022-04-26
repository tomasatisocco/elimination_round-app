import 'package:bloc/bloc.dart';
import 'package:elemination_round_app/features/authentication/data/datasources/authentication_firebase_datasource.dart';
import 'package:elemination_round_app/features/authentication/data/models/authentication_user_model.dart';
import 'package:elemination_round_app/features/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationInitial());

  final AuthenticationRepositoryImpl repository = AuthenticationRepositoryImpl(dataSource: AuthenticationFirebaseDataSourceImpl());

  void authetnicationUserChanged(){
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
      (succes) => emit(const UnauthenticatedUser()),
    );
  }
}
