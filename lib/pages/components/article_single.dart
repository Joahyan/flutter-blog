import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                        // ??????
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(IconData(0xe619,fontFamily: 'MyIcons'),size: 14,),
                            SizedBox(width: 5),
                            Text(articleModel.viewCount.toString()),
                            SizedBox(width: 10),
                            Icon(IconData(0xe696,fontFamily: 'MyIcons'),size: 14),
                            SizedBox(width: 5),
                            Text(articleModel.diggCount.toString()),
                            SizedBox(width: 10),
                            Icon(IconData(0xe651,fontFamily: 'MyIcons'),size: 14),
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
  final String title; // ????????????
  final String author; // ??????
  final String content; // ???????????????
  final String imgUrl; // ???????????????
  final int viewCount; // ?????????????????????
  final int diggCount; // ????????????
  final int commentCount; // ????????????
  final List<String> tags; // ????????????
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
