import 'package:flutter/material.dart';

class TelaFeed extends StatefulWidget {
  const TelaFeed({ Key key }) : super(key: key);

  @override
  _TelaFeedState createState() => _TelaFeedState();
}

class _TelaFeedState extends State<TelaFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Tela feed"),
    );
  }
}