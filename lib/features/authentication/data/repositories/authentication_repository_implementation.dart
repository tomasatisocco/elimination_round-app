import 'package:elemination_round_app/features/authentication/data/datasources/authentication_firebase_datasource.dart';
import 'package:elemination_round_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:elemination_round_app/features/authentication/domain/repositories/authentication_repository.dart';

import '../models/authentication_user_model.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({required this.dataSource});

  final AuthenticationFirebaseDataSource dataSource;

  @override
  Either<Failure, AuthenticationUserModel> isLoggedIn() {
    final AuthenticationUserModel? _userModel = dataSource.isLoggedIn();
    if(_userModel != null){
      return Right(_userModel);
    }
    return const Left(UserNotLoggedIn(errorMessege: 'Usuario no logeado'));
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await dataSource.logout();
      return const Right(null);
    } catch (_) {
      return const Left(LogoutFailure(errorMessege: 'Error al deslogear'));
    }
  }

}