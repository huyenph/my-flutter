import 'package:dio/dio.dart';
import 'package:my_flutter/src/data/datasources/local/shared_preferences_manager.dart';
import 'package:my_flutter/src/modules/auth/data/auth_service.dart';
import 'package:my_flutter/src/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;
  final SharedPreferencesManager _prefsManager;

  AuthRepositoryImpl(this._authService, this._prefsManager);

  @override
  Future<String> getUserToken() async {
    Response<String> response = await _authService.getUserToken();
    return response.data!;
  }
}
