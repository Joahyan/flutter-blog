import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_application/utils/shared_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class StorageManager {
  static SharedPreferences? sp;

  var connect;

  static init() async {
    sp = await SharedPreferences.getInstance();
    if (Platform.isAndroid) {
      StorageManager().initAutoLogin();
    } else {
      print('IOS自动登陆开发中');
    }
  }

  initAutoLogin() async {
    try {
      // 监测网络变化
      connect = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        if (result != ConnectivityResult.mobile &&
            result != ConnectivityResult.wifi) {
          await SharedUtil.instance.saveBoolean(Keys.brokenNetwork, true);
        } else {
          await SharedUtil.instance.saveBoolean(Keys.brokenNetwork, false);
          final hasLogged =
              await SharedUtil.instance.getBoolean(Keys.hasLogged);
          // TODO 接入自动登陆
          // final currentUser = await im.getCurrentLoginUser();
          // if (hasLogged) if (currentUser == '' || currentUser == null) {
          //   final account = await SharedUtil.instance.getString(Keys.account);
          //   im.imAutoLogin(account);
          // }
        }
      });
    } on Exception {
      print('你已登录或者其他错误');
    }
  }
}
