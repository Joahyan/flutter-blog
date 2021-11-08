import 'package:flutter/material.dart';
import 'package:flutter_application/config/theme.dart';
import 'package:flutter_application/pages/login/login.dart';
import 'package:flutter_application/root/root_page.dart';
import 'package:flutter_application/route/route.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO判断是否登陆
    return MaterialApp(
      navigatorKey: navGk,
      title: 'Flutter Blog 练习',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        hintColor: Colors.grey.withOpacity(0.3),
        splashColor: Colors.transparent,
        canvasColor: Colors.transparent
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) {
          return RootPage();
        }
      },
    );
  }
}