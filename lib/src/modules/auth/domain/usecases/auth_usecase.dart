import 'package:my_flutter/src/modules/auth/domain/models/password.dart';
import 'package:my_flutter/src/modules/auth/domain/models/user.dart';
import 'package:my_flutter/src/modules/auth/domain/models/username.dart';
import 'package:my_flutter/src/modules/auth/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  const AuthUseCase(this._authRepository);

  Future<String> getUserToken() => _authRepository.getUserToken();

  Future<void> login(Username username, Password password) =>
      _authRepository.login(username, password);

  Future<User> getUser() => _authRepository.getUser();

  Stream<AuthenticationStatus> get status => _authRepository.status;

  void logout() => _authRepository.logout();

  void dispose() => _authRepository.dispose();
}
