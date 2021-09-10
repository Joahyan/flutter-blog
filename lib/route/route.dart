import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


final navGk = new GlobalKey<NavigatorState>();
GlobalKey<ScaffoldState>? scaffoldGK;

// 路由跳转
Future<dynamic> routePush(Widget widget) {
  final route = new CupertinoPageRoute(
    builder: (BuildContext context)=> widget,
    settings: new RouteSettings(
      name: widget.toStringShort(),
    )
  );
  return navGk.currentState!.push(route);
}
