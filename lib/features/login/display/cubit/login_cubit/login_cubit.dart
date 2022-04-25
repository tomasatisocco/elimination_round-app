import 'package:bloc/bloc.dart';
import 'package:elemination_round_app/features/login/data/datasources/login_firebase_datasource.dart';
import 'package:elemination_round_app/features/login/data/repositories/login_respository_implementation.dart';
import 'package:elemination_round_app/features/login/domain/usecases/login_with_email.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/validations/login_validations.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const EmptyLogin());

  void emailChanged({required String email}){
    emit(UpdateLogin(isEmailValid: LoginValidation.isEmailValid(email), isPasswordValid: state.isPasswordValid));
  }

  void passwordChanged({required String password}){
    emit(UpdateLogin(isEmailValid: state.isEmailValid, isPasswordValid: LoginValidation.isPasswordValid(password)));
  }

  Future<void> loginWithCredentialsPressed({required String email, required String password}) async {
    LoginRepositoryImpl repository = LoginRepositoryImpl(dataSource: LoginFirebaseDataSourceImpl());
    emit(const LoadingLogin());
    final failureOrLogin = await LoginWithEmailAndPassword(repository).call(email: email, password: password);
    failureOrLogin.fold(
      (failure) => emit(FailLogin(error: failure.errorMessege!)),
      (login) => emit(const SuccessLogin())
    );
  }

  bool isFormValid(){
    if(state.isEmailValid && state.isPasswordValid){
      return true;
    }
    return false;
  }
}
