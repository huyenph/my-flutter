import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/src/modules/auth/screens/home/home_screen.dart';
import 'package:my_flutter/src/modules/auth/screens/login/login_screen.dart';
import 'package:my_flutter/src/modules/jobs_graphql/screens/job_screen.dart';
import 'package:my_flutter/src/screens/main_screen.dart';

class RouteGenerator {
  static Route<Object> generateRoute(RouteSettings settings) {
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

  static Route<Object> _errorRoute() {
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

  @optionalTypeArgs
  static Future<T?> push<T extends Object>(
    BuildContext context,
    Route<T> route,
  ) {
    return Navigator.of(context).push(route);
  }

  @optionalTypeArgs
  static Future<T?> pushNamed<T extends Object>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(context, routeName, arguments: arguments);
  }
}
