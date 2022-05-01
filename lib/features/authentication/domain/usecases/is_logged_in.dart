import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/authentication_user.dart';
import '../repositories/authentication_repository.dart';

class IsLoggedIn {
  const IsLoggedIn(this.repository);

  final AuthenticationRepository repository;

  Future<Either<Failure, AuthenticationUser?>> call() async {
    return repository.isLoggedIn();
  }
}
