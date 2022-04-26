import 'package:flutter/material.dart';
import 'package:my_flutter/main_app.dart';
import 'package:my_flutter/src/common/utils/utils.dart';
import 'package:my_flutter/src/configs/app_config.dart';
import 'package:my_flutter/src/di/injector_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig(flavor: Flavor.stag);
  await initializeDependencies();
  appLogging();
  runApp(const MainApp());
}