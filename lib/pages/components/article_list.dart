import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'article_single.dart';

// 文章组件
class ArticleList extends StatefulWidget {
  final List<ArticleModel> articleList;

  ArticleList({this.articleList = const []});

  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<ArticleList> {
  ScrollController _controller = new ScrollController(); //ListView控制器

  List<Widget> buildArticle() {
    List<Widget> articles = [];
    widget.articleList.forEach((element) {
      articles.add(new ArticleSingle(element));
    });
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: widget.articleList.length == 0
            ? new Center(
                child: Text('No Data'),
              )
            : ListView(
          controller: _controller,
          children: buildArticle(),
        )
        );
  }
}
