import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/config/theme.dart';
import 'package:flutter_application/pages/common/bar/common_bar.dart';
import 'package:flutter_application/utils/common_utils.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ArticleDetail extends StatefulWidget {
  // final ArticleDtlModel articleDtlModel;
  // ArticleDetail(this.articleDtlModel);

  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  ArticleDtlModel _articleDtlModel = new ArticleDtlModel(ctime: DateTime.now());
  var tempArticleModel;
  var tempTags = [];

  Future<void> _loadData() async {
    await rootBundle
        .loadString("assets/json/article_detail.json")
        .then((value) => {tempArticleModel = json.decode(value)});
    _articleDtlModel = new ArticleDtlModel(
      avatarUrl: tempArticleModel['author_user_info']['avatar_large'],
      ctime: DateTime.parse(tempArticleModel['article_info']['ctime']),
      imgUrl: tempArticleModel['article_info']['cover_image'],
      author: tempArticleModel['author_user_info']['user_name'],
      content: tempArticleModel['article_info']['mark_content'],
      title: tempArticleModel['article_info']['title'],
      level: tempArticleModel['author_user_info']['level'],
      viewCount: tempArticleModel['article_info']['view_count'],
      commentCount: tempArticleModel['article_info']['comment_count'],
      followCount: tempArticleModel['author_user_info']['followee_count'],
      collectCount: tempArticleModel['article_info']['collect_count'],
      diggCount: tempArticleModel['article_info']['digg_count'],
      // tags: curTags
    );
    // 重构页面
    setState(() {
      _articleDtlModel = _articleDtlModel;
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
    return Scaffold(
      appBar: CommonBar(title: _articleDtlModel.title),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(12, 6, 12, 12),
        color: secondBgColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                // 头像
                Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(_articleDtlModel.avatarUrl),
                      radius: 20,
                    )),
                // 作者、等级以及创建时间
      Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(_articleDtlModel.author,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300)),
                  // TODO  level
                ],
              ),
              Text(
                  dateFormat(
                      _articleDtlModel.ctime, 'yyyy-mm-dd HH:mm:ss'),
                  style: TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.w300))
            ],
          )),
              ],
            ),
            // 文章详情渲染
            Expanded(
                child: ListView(
                  // physics: new NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  children: <Widget>[
                    Image.network(
                      _articleDtlModel.imgUrl,
                      width: 750,
                    ),
                    Markdown(
                        data: _articleDtlModel.content,
                        physics: new NeverScrollableScrollPhysics(),
                        shrinkWrap: true
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class ArticleDtlModel {
  final String avatarUrl;
  final String author;
  final String title;
  final String imgUrl;
  final int level;
  final DateTime ctime;
  final int viewCount;
  final int commentCount;
  final int followCount;
  final int collectCount;
  final int diggCount;
  final String content;
  final List<Map> tags;

  ArticleDtlModel(
      {this.avatarUrl = '',
      this.author = '',
      this.title = '',
      this.imgUrl = '',
      this.level = 1,
      required this.ctime,
      this.viewCount = 0,
      this.commentCount = 0,
      this.followCount = 0,
      this.collectCount = 0,
      this.diggCount = 0,
      this.content = '',
      this.tags = const []});
}
