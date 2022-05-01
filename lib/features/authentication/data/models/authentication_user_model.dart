import '../../domain/entities/authentication_user.dart';

class AuthenticationUserModel extends AuthenticationUser {
  AuthenticationUserModel({String? userEmail, String? userID})
      : super(userEmail: userEmail, userID: userID);
}
