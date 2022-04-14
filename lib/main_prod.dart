import 'package:flutter/material.dart';
import 'package:my_flutter/main_app.dart';
import 'package:my_flutter/src/config/app_config.dart';
import 'package:my_flutter/src/core/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig(flavor: Flavor.prod);
  appLogging();
  runApp(const MainApp());
}