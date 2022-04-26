import 'package:dartz/dartz.dart';
import 'package:elemination_round_app/core/errors/failures.dart';
import 'package:elemination_round_app/features/authentication/domain/entities/authentication_user.dart';
import 'package:elemination_round_app/features/authentication/domain/repositories/authentication_repository.dart';

class IsLoggedIn {
  const IsLoggedIn(this.repository);

  final AuthenticationRepository repository;
  
  Future<Either<Failure,AuthenticationUser?>> call() async {
    return repository.isLoggedIn();
  }
}