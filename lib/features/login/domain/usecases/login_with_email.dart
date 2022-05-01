import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/login_repository.dart';

class LoginWithEmailAndPassword {
  LoginWithEmailAndPassword(this.repository);
  final LoginRepository repository;

  Future<Either<Failure, void>> call(
      {required String email, required String password}) async {
    return await repository.loginWithEmailAndPassword(
        email: email, password: password);
  }
}
