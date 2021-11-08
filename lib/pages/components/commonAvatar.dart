import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonAvatar extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final String time;

  CommonAvatar({required this.avatarUrl,required this.username, this.time = '2021-11-01 12:00:00'});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
            radius: 20,
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(username),
              new Text(time)
            ],
          )
        ],
      ),
    );
  }
}
