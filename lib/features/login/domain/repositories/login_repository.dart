import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> loginWithEmailAndPassword(
      {required String email, required String password});
}
