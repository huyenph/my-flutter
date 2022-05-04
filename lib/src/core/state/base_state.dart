import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter/src/core/state/base_state_listener.dart';
import 'package:my_flutter/src/data/datasources/remote/token_expired_handler.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements BaseStateListener, TokenExpiredListener {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final FocusNode _focusNode = FocusNode();

  String appBarTitle = '';
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
  BuildContext get viewContext => throw UnimplementedError();

  @override
  void onLoading() {}

  @override
  void onDismiss() {}

  @override
  void onError(Exception e) {}

  @override
  void onTokenExpired(TokenType type) {}

  void showLoading() {}

  void dismissLoading() {}

  PreferredSizeWidget buildAppBar() => AppBar(
        title: Text(appBarTitle),
      );

  Drawer? buildDrawer() => null;

  BottomNavigationBar? buildBottomNavigationBar() => null;

  FloatingActionButton? buildFloatingActionButton() => null;

  Widget buildBody();
}
