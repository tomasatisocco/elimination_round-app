import 'package:elemination_round_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:elemination_round_app/features/login/data/datasources/login_firebase_datasource.dart';
import 'package:elemination_round_app/features/login/domain/repositories/login_repositoy.dart';
import '../../../../core/errors/exceptions/login_exceptions.dart';
import '../../../../core/errors/failures.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.dataSource});

  final LoginFirebaseDataSource dataSource;

  @override
  Future<Either<Failure, void>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await dataSource.loginWithEmailAndPassword(email: email, password: password);
      return const Right(null);
    } catch (e) {
      switch (e.runtimeType) {
        case InvalidEmailException:
          return const Left(LoginFailure(errorMessege: 'Email invalido'));
        case PasswordExceptions:
          return const Left(
              LoginFailure(errorMessege: 'Contraseña incorrecta'));
        case UserNotFoundException:
          return const Left(
              LoginFailure(errorMessege: 'No se encontro al usuario'));
        case UserDisabledException:
          return const Left(
              LoginFailure(errorMessege: 'Usisario deshabilitado'));
        case TooManyRequestException:
          return const Left(LoginFailure(
              errorMessege: 'Demasiados intentos seguidos, intenta mas tarde'));
        case UncknownLoginException:
          return const Left(
              LoginFailure(errorMessege: 'Error de autenticacion desconocido'));
        default:
          return const Left(
              LoginFailure(errorMessege: 'Error de autenticacion desconocido'));
      }
    }
  }
}
