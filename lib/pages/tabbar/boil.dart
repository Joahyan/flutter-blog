import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/pages/components/boil_list.dart';
import 'package:flutter_application/pages/components/boil_single.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class BoilPage extends StatefulWidget {
  _BoilState createState() => _BoilState();
}

class _BoilState extends State<BoilPage> {
  List<Boil> boilList = [];
  var tempBoilModel = [];

  int _currentPage = 1;
  static const int PAGE_SIZE = 5;
  ScrollController _controller = new ScrollController(); //ListView控制器

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  数据加载
    _loadData();
  }
  // 
  Future<void> _loadData() async {
    await rootBundle
        .loadString("assets/json/boil.json")
        .then((value) => {tempBoilModel = json.decode(value)});
    _getArticleList();
  }

  void _getArticleList() async {
    // 重构页面
    int lastIndex = _currentPage * PAGE_SIZE > tempBoilModel.length
        ? tempBoilModel.length
        : _currentPage * PAGE_SIZE;
    // _currentPage 为1 时默认为刷新页面。或者刚刷新界面
    if (_currentPage == 1) {
      boilList = [];
    }
    for (int index = (_currentPage - 1) * PAGE_SIZE;
        index < lastIndex;
        index++) {
      var item = tempBoilModel[index];

      Boil boil = new Boil(
          avatar: item['author_user_info']['avatar_large'],
          username: item['author_user_info']['user_name'],
          content: item['msg_Info']['content'],
          hotComment: item['hot_comment']['comment_info']['comment_content'],
          commentCount: item['msg_Info']['comment_count']);
      boilList.add(boil);
    }
    setState(() {
      boilList = boilList;
    });
  }

  void _refresh() async {
    _currentPage = 1;
    _getArticleList();
  }

  void _load() async {
    _currentPage++;
    _getArticleList();
  }

  List<Widget> buildBoil() {
    List<Widget> boils = [];
    boilList.forEach((element) {
      boils.add(new BoilSingle(element));
    });
    return boils;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12.0),
        child: boilList.length == 0
            ? new Center(
                child: Text('No Data'),
              )
            : EasyRefresh(
                child: ListView(
                  controller: _controller,
                  children: buildBoil(),
                ),
                onLoad: () async {
                  _load();
                },
                onRefresh: () async {
                  _refresh();
                },
              ));
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
