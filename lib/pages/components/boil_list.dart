import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/components/boil_single.dart';
import 'package:flutter_application/pages/tabbar/boil.dart';

// 沸点list组件（暂未使用）
class BoilList extends StatefulWidget {
  final List<Boil> boilList;
  BoilList({this.boilList = const []});
  _BoilState createState() => _BoilState();
}

class _BoilState extends State<BoilList> {
  ScrollController _controller = new ScrollController(); //ListView控制器

  List<Widget> buildBoil() {
    List<Widget> boils = [];
    widget.boilList.forEach((element) {
      boils.add(new BoilSingle(element));
    });
    return boils;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: widget.boilList.length == 0
            ? new Center(
                child: Text('No Data'),
              )
            : ListView(
                controller: _controller,
                children: buildBoil(),
              ));
  }
}
