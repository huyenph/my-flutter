import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/src/di/injector_setup.dart';
import 'package:my_flutter/src/modules/auth/blocs/login/login_bloc.dart';
import 'package:my_flutter/src/modules/auth/screens/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (_) => LoginBloc(injector()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
