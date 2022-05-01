import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/authentication_firebase_datasource.dart';
import '../models/authentication_user_model.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({required this.dataSource});

  final AuthenticationFirebaseDataSource dataSource;

  @override
  Either<Failure, AuthenticationUserModel> isLoggedIn() {
    final AuthenticationUserModel? _userModel = dataSource.isLoggedIn();
    if (_userModel != null) {
      return Right(_userModel);
    }
    return const Left(UserNotLoggedIn(errorMessage: 'Usuario no ingresado'));
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await dataSource.logout();
      return const Right(null);
    } catch (_) {
      return const Left(LogoutFailure(errorMessage: 'Error al salir'));
    }
  }
}
