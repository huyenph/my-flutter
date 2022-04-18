library injector_setup;

import 'package:get_it/get_it.dart';
import 'package:my_flutter/src/data/datasources/local/database_helper.dart';
import 'package:my_flutter/src/data/datasources/local/shared_preferences_manager.dart';
import 'package:my_flutter/src/data/datasources/remote/http_handler.dart';
import 'package:my_flutter/src/data/datasources/remote/rest_api_factory.dart';
import 'package:my_flutter/src/data/datasources/remote/token_expired_handler.dart';

part 'independent_injector.dart';
part 'dependent_injector.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  setupIndependent();
  setupDependent();
}