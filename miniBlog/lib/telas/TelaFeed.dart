import 'package:flutter/material.dart';
import 'package:miniBlog/widgets_padrao/TestePosts.dart';

class TelaFeed extends StatefulWidget {
  const TelaFeed({Key key}) : super(key: key);

  @override
  _TelaFeedState createState() => _TelaFeedState();
}

class _TelaFeedState extends State<TelaFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listaDePosts(),
    );
  }

  Widget listaDePosts() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return posts[index];
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          indent: 12,
          endIndent: 12,
          thickness: 1,
        ),
        itemCount: posts.length,
      ),
    );
  }
}
