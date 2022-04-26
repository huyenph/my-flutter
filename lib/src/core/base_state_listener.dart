import 'package:flutter/material.dart';

abstract class BaseStateListener {
  void onLoading();

  void onDismiss();

  void onError(Object e, {VoidCallback onTryAgain});
}
