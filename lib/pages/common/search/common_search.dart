import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/config/theme.dart';

class CommonSearch extends StatefulWidget {
  final Color color;
  final GestureTapCallback? onTap;
  final Icon? icon;
  final String hint;

  CommonSearch(
      {this.color = const Color(0xfff4f4f4),
      this.onTap,
      this.icon,
      this.hint = ''});

  _CommonSearchState createState() => _CommonSearchState();
}

class _CommonSearchState extends State<CommonSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
      decoration: new BoxDecoration(
          border: new Border.all(color: widget.color),
          borderRadius: new BorderRadius.all(new Radius.circular(5.0))),
      alignment: Alignment.center,
      height: 36,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Theme(
        data: ThemeData(primaryColor: widget.color),
        child: new TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              border: InputBorder.none,
              icon: widget.icon,
              hintText: widget.hint,
              hintStyle: new TextStyle(
                  fontSize: 14.0, color: hintColor)),
          cursorColor: hintColor,
          style: new TextStyle(fontSize: 14, color: Colors.black),
          onTap: () => widget.onTap!(),
        ),
      ),
    );
  }
}
