import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/config/theme.dart';
import 'package:flutter_application/pages/common/search/common_search.dart';
import 'package:flutter_application/pages/components/article_list.dart';
import 'package:flutter_application/pages/components/article_single.dart';

class IndexPage extends StatefulWidget {
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<IndexPage> with TickerProviderStateMixin {
  late TabController _tabController;
  var _tabList = [];
  var _articleList = [];

  List<ArticleModel> _articleModels = [];

  Future<void> _loadData() async {
    await rootBundle
        .loadString("assets/json/categories.json")
        .then((value) => {_tabList = json.decode(value)});

    await rootBundle
        .loadString("assets/json/articles.json")
        .then((value) => {_articleList = json.decode(value)});
    _articleList.forEach((element) {
      var articleInfo = element['article_info'];
      List<String> tags = [];
      var curTags = [];
      curTags = element['tags'];
      curTags.forEach((e) {
        tags.add(e['tag_name']);
      });
      var articleModel = new ArticleModel(
          title: articleInfo['title'],
          author: element['author_user_info']['user_name'],
          content: articleInfo['brief_content'],
          imgUrl: articleInfo['cover_image'],
          viewCount: articleInfo['view_count'],
          diggCount: articleInfo['digg_count'],
          commentCount: articleInfo['comment_count'],
          ctime: double.parse(articleInfo['ctime']),
          tags: tags);
      _articleModels.add(articleModel);
    });
    // _articleModels = _articleModels;
    setState(() {
      _articleModels = _articleModels;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    // 分类
    _tabController = TabController(length: _tabList.length, vsync: this);

    return new Container(
      child: new Column(
        children: [
          Container(
            color: secondBgColor,
            padding: EdgeInsets.fromLTRB(12, 6, 12, 0),
            child: CommonSearch(
              hint: '搜索掘金',
              icon: Icon(CupertinoIcons.search),
              onTap: () => {
                // TODO 接入搜索
              },
            ),
          ),
          Expanded(
              child: Scaffold(
            backgroundColor: secondBgColor,
            appBar: TabBar(
                controller: _tabController,
                isScrollable: true,
                // 可滚动
                labelColor: primaryColor,
                unselectedLabelColor: firstColor,
                labelStyle: TextStyle(fontSize: 12.0),
                tabs: _tabList
                    .map((e) => Tab(
                          text: e['category_name'],
                        ))
                    .toList()),
            body: new TabBarView(
              controller: _tabController,
              children: _tabList.map((e) {
                //创建3个Tab页
                return Container(
                    padding: EdgeInsets.fromLTRB(12, 6, 12, 0),
                    alignment: Alignment.center,
                    child: ArticleList(
                      articleList: _articleModels,
                    ));
              }).toList(),
            ),
          )),
        ],
      ),
    );
  }
}
