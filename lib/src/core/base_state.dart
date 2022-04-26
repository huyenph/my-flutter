import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter/src/core/base_state_listener.dart';
import 'package:my_flutter/src/data/datasources/remote/token_expired_handler.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements BaseStateListener, TokenExpiredListener {
  BuildContext get viewContext;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final FocusNode _focusNode = FocusNode();

  bool get isMounted;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return Platform.isIOS;
        }
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_focusNode),
        child: Scaffold(
          key: _scaffoldKey,
          appBar: buildAppBar(),
          drawer: buildDrawer(),
          bottomNavigationBar: buildBottomNavigationBar(),
          floatingActionButton: buildFloatingActionButton(),
          body: buildBody(),
        ),
      ),
    );
  }

  @override
  void onTokenExpired(TokenType type) {

  }

  void showLoading() {

  }

  void dismissLoading() {

  }

  PreferredSizeWidget buildAppBar() => AppBar(
        title: const Text("App bar"),
      );

  Drawer? buildDrawer() => null;

  BottomNavigationBar? buildBottomNavigationBar() => null;

  FloatingActionButton? buildFloatingActionButton() => null;

  Widget buildBody();
}
