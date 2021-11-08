import 'package:flutter/cupertino.dart';
import 'package:flutter_application/pages/components/commonAvatar.dart';
import 'package:flutter_application/pages/components/common_rich_text.dart';
import 'package:flutter_application/pages/tabbar/boil.dart';

class BoilSingle extends StatelessWidget {
  final Boil boil;

  BoilSingle(this.boil);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          CommonAvatar(avatarUrl: boil.avatar, username: boil.username),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          CommonRichText(text: boil.content)
        ],
      ),
    );
  }
}
