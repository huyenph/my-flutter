import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:my_flutter/src/data/datasources/local/shared_preferences_manager.dart';
import 'package:my_flutter/src/modules/auth/data/auth_service.dart';
import 'package:my_flutter/src/modules/auth/domain/models/password.dart';
import 'package:my_flutter/src/modules/auth/domain/models/user.dart';
import 'package:my_flutter/src/modules/auth/domain/models/username.dart';
import 'package:my_flutter/src/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;
  final SharedPreferencesManager _prefsManager;

  final _controller = StreamController<AuthenticationStatus>();

  AuthRepositoryImpl(this._authService, this._prefsManager);

  @override
  Future<String> getUserToken() async {
    Response<String> response = await _authService.getUserToken();
    return response.data!;
  }

  @override
  Future<void> login(Username username, Password password) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  @override
  Future<User> getUser() async {
    return Future.delayed(const Duration(milliseconds: 300),
        () => User(Random().nextInt(100).toString()));
  }

  @override
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  void logout() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  void dispose() => _controller.close();
}
