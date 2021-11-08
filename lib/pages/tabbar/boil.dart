import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/pages/components/boil_list.dart';

class BoilPage extends StatefulWidget {
  _BoilState createState() => _BoilState();
}

class _BoilState extends State<BoilPage> {
  List<Boil> boilList = [];
  var tempBoilModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  数据加载
    _loadData();
  }

  Future<void> _loadData() async {
    await rootBundle
        .loadString("assets/json/boil.json")
        .then((value) => {tempBoilModel = json.decode(value)});

    // 重构页面
    tempBoilModel.forEach((item) {
      Boil boil = new Boil(
          avatar: item['author_user_info']['avatar_large'],
          username: item['author_user_info']['user_name'],
          content: item['msg_Info']['content'],
          hotComment: item['hot_comment']['comment_info']['comment_content'],
          commentCount: item['msg_Info']['comment_count']);
      boilList.add(boil);
    });
    setState(() {
      boilList = boilList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12.0),
        child: BoilList(boilList: boilList)
    );
  }
}

class Boil {
  final String avatar;
  final String username;
  final String content;
  final String hotComment;
  final int commentCount;

  Boil(
      {required this.avatar,
      required this.username,
      required this.content,
      required this.hotComment,
      required this.commentCount});
}
