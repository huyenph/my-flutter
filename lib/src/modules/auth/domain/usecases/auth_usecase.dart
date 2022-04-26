import 'package:my_flutter/src/modules/auth/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  const AuthUseCase(this._authRepository);

  Future<String> getUserToken() => _authRepository.getUserToken();
}
