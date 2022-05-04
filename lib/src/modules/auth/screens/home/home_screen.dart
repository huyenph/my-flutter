import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/src/core/state/base_stateless.dart';
import 'package:my_flutter/src/di/injector_setup.dart';
import 'package:my_flutter/src/modules/auth/blocs/authentication_bloc.dart';
import 'package:my_flutter/src/modules/auth/domain/repositories/auth_repository.dart';

class HomeScreen extends BaseStateless {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget buildBody() {
    return BlocProvider(
      create: (_) => AuthenticationBloc(injector()),
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
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
    );
  }

  @override
  String get appBarTitle => 'Home';
}
