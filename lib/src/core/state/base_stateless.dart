import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter/src/data/datasources/remote/token_expired_handler.dart';

abstract class BaseStateless extends StatelessWidget {
  BaseStateless({Key? key}) : super(key: key);

  final FocusNode focusNode = FocusNode();
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final String appBarTitle = '';

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? WillPopScope(
            onWillPop: () async => true,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(focusNode),
              child: Scaffold(
                key: _scaffoldKey,
                appBar: buildAppBar(),
                body: buildBody(),
              ),
            ),
          )
        : GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(focusNode),
            child: Scaffold(
              key: _scaffoldKey,
              appBar: buildAppBar(),
              body: buildBody(),
            ),
          );
  }

  PreferredSizeWidget buildAppBar() => AppBar(
        title: const Text('AppBar'),
      );

  Widget buildBody();

  void _tokenExpired(TokenType type) async {
//    _authApiService.signOut().then((_) async {
//      showInformDialog(
//          null,
//          type == ExpiredType.TOKEN_EXPIRED
//              ? appStrings.MSG_TOKEN_EXPIRED
//              : appStrings.MSG_ACCOUNT_SIGNED_IN_ANOTHER_DEVICE,
//          appStrings.OK,
//              () => Navigator.pushNamedAndRemoveUntil(
//              context, appStrings.SIGN_IN_ROUTE, (_) => false));
//    });
    clearMemory();
  }

  void clearMemory() {}
}
