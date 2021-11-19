import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/common/bar/common_bar.dart';
import 'package:flutter_application/pages/common/button/common_button.dart';
import 'package:flutter_application/pages/components/login/bubble_widget.dart';
import 'package:flutter_application/pages/login/login.dart';
import 'package:flutter_application/pages/login/register.dart';
import 'package:flutter_application/route/route.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _ColorTween { color1, color2 }

class CoolPage extends StatefulWidget {
  _CoolPageState createState() => _CoolPageState();
}

class _CoolPageState extends State<CoolPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: CommonBar(title: 'Welcome',),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned.fill(child: AnimatedBackground()),
            Positioned.fill(child: BubbleWidget(30)),
            Positioned.fill(
                child: new Center(
                    child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  'Welcome',
                  style: new TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TODO 配置按钮颜色
                    CommonButton(
                      text: 'Sign up',
                      onTap: () => routePush(new RegisterPage()),
                      width: 100.0,
                      gradient: LinearGradient(colors: [
                        Color(0xffA83279),
                        Colors.lightBlue.shade600
                      ]),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    CommonButton(
                      text: 'Sign in',
                      onTap: () => routePush(new LoginPage()),
                      width: 100.0,
                      gradient: LinearGradient(colors: [
                        Color(0xffA83279),
                        Colors.lightBlue.shade600
                      ]),
                    ),
                  ],
                )
              ],
            )))
          ],
        ));
  }
}

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_ColorTween>()
      ..add(_ColorTween.color1,
          Color(0xffA83279).tweenTo(Colors.lightBlue.shade900), 3.seconds)
      ..add(_ColorTween.color2, Color(0xffA83279).tweenTo(Colors.blue.shade600),
          3.seconds);

    return MirrorAnimation<MultiTweenValues<_ColorTween>>(
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  value.get<Color>(_ColorTween.color1),
                  value.get<Color>(_ColorTween.color2),
                ]),
          ),
        );
      },
      tween: tween,
      duration: tween.duration,
    );
  }
}
