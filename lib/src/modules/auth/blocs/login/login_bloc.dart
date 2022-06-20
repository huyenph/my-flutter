import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_flutter/src/modules/auth/domain/models/password.dart';
import 'package:my_flutter/src/modules/auth/domain/models/username.dart';
import 'package:my_flutter/src/modules/auth/domain/usecases/auth_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase _authUseCase;

  LoginBloc(this._authUseCase) : super(const LoginState()) {
    on<LoginUsernameChanged>(_onLoginUsernameChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onLoginUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emitter,
  ) {
    final username = Username.dirty(event.username);
    emitter(state.copyWith(
      status: Formz.validate([state.password, username]),
      username: username,
    ));
  }

  void _onLoginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emitter,
  ) {
    final password = Password.dirty(event.password);
    emitter(state.copyWith(
      status: Formz.validate([password, state.username]),
      password: password,
    ));
  }

  void _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emitter,
  ) async {
    if (state.status.isValidated) {
      emitter(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authUseCase.login(state.username, state.password);
        emitter(state.copyWith(status: FormzStatus.pure));
      } catch (_) {
        emitter(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
