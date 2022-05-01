import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/authentication_repository.dart';

class LogOut {
  LogOut(this.repository);

  final AuthenticationRepository repository;

  Future<Either<Failure, void>> call() async {
    return await repository.logOut();
  }
}
