import 'package:my_flutter/src/modules/auth/domain/models/password.dart';
import 'package:my_flutter/src/modules/auth/domain/models/user.dart';
import 'package:my_flutter/src/modules/auth/domain/models/username.dart';

enum AuthenticationStatus { unknown, unauthenticated, authenticated }

abstract class AuthRepository {
  Future<String> getUserToken();
  Future<void> login(Username username, Password password);
  Stream<AuthenticationStatus> get status;
  Future<User> getUser();
  void logout();
  void dispose();
}