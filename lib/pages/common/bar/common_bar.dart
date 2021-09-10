import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/config/theme.dart';

class CommonBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showShadow;
  final List<Widget>? rightDMActions;
  final Color backgroundColor;
  final Color mainColor;
  final Widget? titleW;
  final Widget? leadingW;
  final PreferredSizeWidget? bottom;
  final String leadingImg;

  CommonBar(
      {this.title = '',
      this.showShadow = false,
      this.rightDMActions,
      this.backgroundColor = appBarColor,
      this.mainColor = Colors.white,
      this.titleW,
      this.leadingW,
      this.bottom,
      this.leadingImg = ''});

  // tabBar 左侧图标及相关操作逻辑
  Widget? leading(BuildContext context) {
    bool isShow = Navigator.canPop(context);
    if (isShow) {
      return new InkWell(
        child: new Container(
          width: 15,
          height: 28,
          child: leadingImg != ''
              ? new Image.asset(leadingImg)
              : new Icon(CupertinoIcons.back, color: mainColor),
        ),
        onTap: () {
          if (Navigator.canPop(context)) {
            FocusScope.of(context).requestFocus(new FocusNode());
            Navigator.pop(context);
          }
        },
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 封装appBar
    Widget appBar = new AppBar(
      title: titleW != null
          ? titleW
          : new Text(
              title,
              style: new TextStyle(
                color: mainColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
      backgroundColor: backgroundColor,
      elevation: 0,
      brightness: Brightness.light,
      leading: leadingW ?? leading(context),
      centerTitle: true,
      actions: rightDMActions ?? [new Center()],
      bottom: bottom ?? null,
    );
    return showShadow
        ? new Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: new BorderSide(color: Colors.grey, width: 0.5))),
            child: appBar,
          )
        : appBar;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size(100, 50);
}
