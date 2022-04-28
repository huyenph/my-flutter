import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/src/modules/auth/domain/models/user.dart';
import 'package:my_flutter/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:my_flutter/src/modules/auth/domain/usecases/auth_usecase.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthUseCase _authUseCase;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  AuthenticationBloc(this._authUseCase)
      : super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authUseCase.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authUseCase.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emitter,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emitter(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final user = await _getUser();
        return emitter(
          user != null
              ? AuthenticationState.authenticated(user)
              : const AuthenticationState.unauthenticated(),
        );
      default:
        return emitter(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emitter,
  ) {}

  Future<User?> _getUser() async {
    try {
      final user = await _authUseCase.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
