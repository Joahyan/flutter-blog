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

  @override
  Widget build(BuildContext context) {
    rootBundle.loadString("assets/json/article_detail.json").then((value) => {
          tempArticleModel = json.decode(value),
          tempTags = tempArticleModel['tags'],
          _articleDtlModel = new ArticleDtlModel(
            avatarUrl: tempArticleModel['author_user_info']['avatar_large'],
            ctime: DateTime.parse(tempArticleModel['article_info']['ctime']),
            author: tempArticleModel['author_user_info']['user_name'],
            content: tempArticleModel['article_info']['mark_content'],
            title: tempArticleModel['article_info']['title'],
            level: tempArticleModel['author_user_info']['level'],
            viewCount: tempArticleModel['article_info']['view_count'],
            commentCount: tempArticleModel['article_info']['comment_count'],
            followCount: tempArticleModel['author_user_info']['followee_count'],
            collectCount: tempArticleModel['article_info']['collect_count'],
            diggCount: tempArticleModel['article_info']['digg_count'],
          ),
          tempTags.forEach((element) {
            _articleDtlModel.tags
                .add({'name': element['tag_name'], 'icon': element['icon']});
          })
        });
    return Scaffold(
      appBar: CommonBar(title: _articleDtlModel.title),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(12, 6, 12, 12),
        color: secondBgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(_articleDtlModel.avatarUrl),
                      radius: 20,
                    )),
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
            Expanded(child: Markdown(data: _articleDtlModel.content))
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
