import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../../core/errors/exceptions/authentication_exceptions.dart';
import '../models/authentication_user_model.dart';

abstract class AuthenticationFirebaseDataSource {
  Future<void> logout();
  AuthenticationUserModel? isLoggedIn();
}

class AuthenticationFirebaseDataSourceImpl
    implements AuthenticationFirebaseDataSource {
  AuthenticationFirebaseDataSourceImpl(
      {firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  AuthenticationUserModel? isLoggedIn() {
    firebase_auth.User? _user = _firebaseAuth.currentUser;
    if (_user != null) {
      return AuthenticationUserModel(
        userEmail: _user.email,
        userID: _user.uid,
      );
    }
    return null;
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      throw LogOutException();
    }
  }
}
