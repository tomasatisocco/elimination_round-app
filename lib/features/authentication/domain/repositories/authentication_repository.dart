import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/authentication_user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, void>> logOut();
  Either<Failure, AuthenticationUser> isLoggedIn();
}
