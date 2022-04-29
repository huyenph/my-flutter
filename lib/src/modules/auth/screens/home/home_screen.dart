import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/src/di/injector_setup.dart';
import 'package:my_flutter/src/modules/auth/blocs/authentication_bloc.dart';
import 'package:my_flutter/src/modules/auth/domain/repositories/auth_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationBloc(injector()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.status == AuthenticationStatus.unauthenticated) {
              Navigator.pushNamed(context, '/auth-login');
            }
            if (state.status == AuthenticationStatus.authenticated) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state.status == AuthenticationStatus.authenticated) ...[
                    Text('UserId: ${state.user.id}'),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(AuthenticationLogoutRequested());
                      },
                      child: const Text('Logout'),
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/auth-login');
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
