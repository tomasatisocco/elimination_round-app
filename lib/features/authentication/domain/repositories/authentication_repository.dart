import 'package:dartz/dartz.dart';
import 'package:elemination_round_app/features/authentication/domain/entities/authentication_user.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure,void>> logOut();
  Either<Failure,AuthenticationUser> isLoggedIn();
}