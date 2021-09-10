import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/config/theme.dart';
import 'package:flutter_application/pages/tabbar/Index.dart';
import 'package:flutter_application/pages/tabbar/mine.dart';
import 'package:flutter_application/pages/tabbar/boil.dart';
import 'package:flutter_application/root/root_tabbar.dart';
import 'package:flutter_application/route/route.dart';

class RootPage extends StatefulWidget {
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    List<TabBarModel> pages = <TabBarModel>[
      new TabBarModel(
          title: "首页",
          icon: const Icon(IconData(0xe7c0,fontFamily: 'MyIcons')),
          selectIcon: const Icon(IconData(0xe7c0,fontFamily: 'MyIcons'),color: primaryColor,),
          page: new IndexPage()),
      // new TabBarModel(
      //     title: '沸点',
      //     icon: new LoadImage("assets/images/tab_order_normal_icon.png"),
      //     selectIcon:
      //         new LoadImage("assets/images/tab_order_selected_icon.png"),
      //     page: new BoilPage()),
      new TabBarModel(
          title: '发现',
          icon: const Icon(IconData(0xe8d6,fontFamily: 'MyIcons')),
          selectIcon:const Icon(IconData(0xe8d6,fontFamily: 'MyIcons'),color: primaryColor,),
          page: new BoilPage()),
      // new TabBarModel(
      //     title: '小册',
      //     icon: new LoadImage("assets/images/tab_order_normal_icon.png"),
      //     selectIcon:
      //     new LoadImage("assets/images/tab_order_selected_icon.png"),
      //     page: new BoilPage()),
      new TabBarModel(
          title: '我的',
          icon: const Icon(IconData(0xe613,fontFamily: 'MyIcons')),
          selectIcon:const Icon(IconData(0xe613,fontFamily: 'MyIcons'),color: primaryColor,),
          page: new MinePage())
    ];
    return new Scaffold(
      key: scaffoldGK,
      body: new RootTabBar(pages: pages, currentIndex: 0),
    );
  }
}

class LoadImage extends StatelessWidget {
  final String img;

  LoadImage(this.img);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 2.0),
      child: new Image.asset(img, fit: BoxFit.cover, gaplessPlayback: true),
    );
  }
}
