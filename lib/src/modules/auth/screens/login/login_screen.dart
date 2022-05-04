import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/src/core/state/base_stateless.dart';
import 'package:my_flutter/src/di/injector_setup.dart';
import 'package:my_flutter/src/modules/auth/blocs/login/login_bloc.dart';
import 'package:my_flutter/src/modules/auth/screens/login/login_form.dart';

class LoginScreen extends BaseStateless {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: BlocProvider(
        create: (_) => LoginBloc(injector()),
        child: const LoginForm(),
      ),
    );
  }

  @override
  String get appBarTitle => 'Login';
}
