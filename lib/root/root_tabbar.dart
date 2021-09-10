import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/config/theme.dart';
import 'package:flutter_application/pages/common/bar/common_bar.dart';

class RootTabBar extends StatefulWidget {
  final List pages;
  final int currentIndex;

  RootTabBar({required this.pages, this.currentIndex = 0});

  State<StatefulWidget> createState() => new RootTabBarState();
}

class RootTabBarState extends State<RootTabBar> {
  List<BottomNavigationBarItem> pages = [];
  late int currentIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    pageController = PageController(initialPage: currentIndex);
    widget.pages.forEach((element) {
      TabBarModel model = element;
      pages.add(new BottomNavigationBarItem(
          icon: model.icon,
          activeIcon: model.selectIcon,
          title: new Text(
            model.title!,
            style: new TextStyle(fontSize: 12.0),
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    // if(pageController) {
    pageController = PageController(initialPage: currentIndex);
    // }
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: pages,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
          pageController.jumpToPage(currentIndex);
        });
      },
      unselectedFontSize: 12.0,
      selectedFontSize: 12.0,
      selectedItemColor: primaryColor,
      elevation: 0,
    );

    var appBar = new CommonBar(
        title: widget.pages[currentIndex].title, showShadow: false);

    return Scaffold(
      resizeToAvoidBottomInset: false, // 键盘弹起引起的挤压问题
      // 底部tab栏
      bottomNavigationBar: new Theme(
          data: new ThemeData(
              canvasColor: Colors.grey[50],
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent),
          child: new Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: lineColor, width: 0.2))),
            child: bottomNavigationBar,
          )),
      // 头部tab栏
      appBar: appBar,
      // body
      body: new PageView.builder(
        itemBuilder: (BuildContext context, int index) =>
            widget.pages[index].page,
        controller: pageController,
        itemCount: pages.length,
        physics: Platform.isAndroid
            ? new ClampingScrollPhysics()
            : new NeverScrollableScrollPhysics(),
        onPageChanged: (int index) => setState(() => currentIndex = index),
      ),
    );
  }
}

class TabBarModel {
  final String? title;
  final Widget icon;
  final Widget? selectIcon;
  final Widget? page;

  TabBarModel({this.title, required this.icon, this.selectIcon, this.page});
}
