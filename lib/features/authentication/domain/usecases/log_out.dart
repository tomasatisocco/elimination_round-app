import 'package:dartz/dartz.dart';
import 'package:elemination_round_app/core/errors/failures.dart';
import 'package:elemination_round_app/features/authentication/domain/repositories/authentication_repository.dart';

class LogOut {
  LogOut(this.repository);

  final AuthenticationRepository repository;

  Future<Either<Failure,void>> call() async {
    return await repository.logOut();
  }
}