import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/application.dart';
import 'package:my_flutter/src/common/utils/utils.dart';
import 'package:my_flutter/src/configs/app_config.dart';
import 'package:my_flutter/src/core/blocs/application_observer.dart';
import 'package:my_flutter/src/di/injector_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig(flavor: Flavor.stag);
  await initializeDependencies();
  appLogging();
  BlocOverrides.runZoned(
    () => runApp(const Application()),
    blocObserver: ApplicationObserver(),
  );
}
