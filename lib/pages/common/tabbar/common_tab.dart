import 'package:flutter/cupertino.dart';
import 'package:flutter_application/config/theme.dart';

class CommonTab extends StatefulWidget {
  final List<TabModel> tabModel; // 显示列表
  final GestureTapCallback? onTap; // 点击回调
  final String direction;
  final int currentIndex;

  CommonTab(
      {this.tabModel = const [],
      this.onTap,
      this.direction = 'vertical',
      this.currentIndex = 0});

  _CommonTabState createState() => _CommonTabState();
}

class _CommonTabState extends State<CommonTab> {
  @override
  Widget build(BuildContext context) {
    var body = <Widget>[];
    int index = 0;
    for (TabModel model in widget.tabModel) {
      if(model.type == 'disabled') {
        // model.style.
      }
      body.add(new Container(
        child: new Text(
          model.title,
          style: model.style,
        ),
      ));
    }
    return widget.direction == 'vertical'
        ? new Row(children: body, crossAxisAlignment: CrossAxisAlignment.center,)
        : new Column(children: body, mainAxisAlignment: MainAxisAlignment.spaceBetween,);
  }
}

class TabModel {
  final String type; // tab文字类型，default（默认），disabled
  final TextStyle style;
  final String title;

  TabModel(
      {this.title = '',
      this.type = 'default;',
      this.style = const TextStyle(fontSize: 14.0, color: secondColor)});
}
