import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/src/modules/auth/screens/home/home_screen.dart';
import 'package:my_flutter/src/modules/auth/screens/login/login_screen.dart';
import 'package:my_flutter/src/modules/graphqljobs/screens/job_screen.dart';
import 'package:my_flutter/src/screens/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const MainScreen());
      case '/auth-home':
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case '/auth-login':
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case '/job-graphql':
        return CupertinoPageRoute(builder: (_) => const JobScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: const Center(
                child: Text('Oops!\nSomething went wrong.'),
              ),
            ));
  }
}
