import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../../core/errors/exceptions/login_exceptions.dart';

abstract class LoginFirebaseDataSource {
  Future<void>? loginWithEmailAndPassword(
      {required String email, required String password});
}

class LoginFirebaseDataSourceImpl implements LoginFirebaseDataSource {
  LoginFirebaseDataSourceImpl({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  Future<void>? loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          //Thrown if the email address is not valid.
          throw InvalidEmailException();
        case "user-disabled":
          //Thrown if the user corresponding to the given email has been disabled.
          throw UserDisabledException();
        case "user-not-found":
          //Thrown if there is no user corresponding to the given email.
          throw UserNotFoundException();
        case "wrong-password":
          throw PasswordExceptions();
        //Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
        case "too-many-requests":
          throw TooManyRequestException();
        default:
          throw UnknownLoginException();
      }
    }
  }
}
