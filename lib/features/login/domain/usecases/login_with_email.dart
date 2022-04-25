import 'package:dartz/dartz.dart';
import 'package:elemination_round_app/core/errors/failures.dart';
import 'package:elemination_round_app/features/login/domain/repositories/login_repositoy.dart';

class LoginWithEmailAndPassword {
  LoginWithEmailAndPassword(this.repository);
  final LoginRepository repository;

  Future<Either<Failure,void>> call({required String email, required String password}) async {
    return await repository.loginWithEmailAndPassword(email: email, password: password);
  }
}