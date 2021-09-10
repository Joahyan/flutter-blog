import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/config/theme.dart';
import 'package:flutter_application/pages/tabbar/article_detail.dart';
import 'package:flutter_application/route/route.dart';

class ArticleSingle extends StatelessWidget {
  final ArticleModel articleModel;

  ArticleSingle(this.articleModel);

  @override
  Widget build(BuildContext context) {
    List<Widget> getTagList() {
      List<Widget> tagList = [];
      articleModel.tags.forEach((element) {
        tagList.add(RawChip(
          label: Text(element),
          labelStyle: TextStyle(fontSize: 10.0),
          padding: EdgeInsets.all(0),
        ));
      });
      return tagList;
    }

    return Container(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: ()=> {
          routePush(new ArticleDetail())
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text(
              articleModel.title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            new Text(articleModel.author,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12.0)),
                            SizedBox(width: 10),
                            ...getTagList()
                          ],
                        ),
                        new Text(
                          articleModel.content,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // 数量
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(CupertinoIcons.eye,size: 14,color: secondColor,),
                            SizedBox(width: 5),
                            Text(articleModel.viewCount.toString()),
                            SizedBox(width: 10),
                            Icon(Icons.thumb_up,size: 14,color: secondColor,),
                            SizedBox(width: 5),
                            Text(articleModel.diggCount.toString()),
                            SizedBox(width: 10),
                            Icon(Icons.comment,size: 14,color: secondColor,),
                            SizedBox(width: 5),
                            Text(articleModel.commentCount.toString())
                          ],
                        )
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Image.network(
                          articleModel.imgUrl,
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),

    );
  }
}

class ArticleModel {
  final String title; // 文章标题
  final String author; // 作者
  final String content; // 文章副标题
  final String imgUrl; // 渲染的图片
  final int viewCount; // 查看文章的数量
  final int diggCount; // 点赞数量
  final int commentCount; // 评论数量
  final List<String> tags; // 文章标签
  final double ctime;

  ArticleModel(
      {this.title = '',
      this.author = '',
      this.content = '',
      this.imgUrl = '',
      this.viewCount = 0,
      this.diggCount = 0,
      this.commentCount = 0,
      this.tags = const [],
      this.ctime = 0});
}
