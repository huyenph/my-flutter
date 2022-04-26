import 'package:my_flutter/src/core/view_error.dart';

abstract class BaseController {
  ViewError _error = ViewError();
  bool _showLoading = false;

  void notifyShowLoading() {

  }
}