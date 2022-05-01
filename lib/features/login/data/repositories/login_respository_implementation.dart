import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions/login_exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_firebase_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.dataSource});

  final LoginFirebaseDataSource dataSource;

  @override
  Future<Either<Failure, void>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await dataSource.loginWithEmailAndPassword(
          email: email, password: password);
      return const Right(null);
    } catch (e) {
      switch (e.runtimeType) {
        case InvalidEmailException:
          return const Left(LoginFailure(errorMessage: 'Email invalido'));
        case PasswordExceptions:
          return const Left(
              LoginFailure(errorMessage: 'Contraseña incorrecta'));
        case UserNotFoundException:
          return const Left(
              LoginFailure(errorMessage: 'No se encontró al usuario'));
        case UserDisabledException:
          return const Left(
              LoginFailure(errorMessage: 'Usurario deshabilitado'));
        case TooManyRequestException:
          return const Left(LoginFailure(
              errorMessage: 'Demasiados intentos seguidos, intenta mas tarde'));
        case UnknownLoginException:
          return const Left(
              LoginFailure(errorMessage: 'Error de autenticación desconocido'));
        default:
          return const Left(
              LoginFailure(errorMessage: 'Error de autenticación desconocido'));
      }
    }
  }
}
