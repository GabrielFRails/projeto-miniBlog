import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/widgets_padrao/PostagemWidget.dart';

class TelaFeed extends StatefulWidget {
  const TelaFeed({Key key}) : super(key: key);

  @override
  _TelaFeedState createState() => _TelaFeedState();
}

class _TelaFeedState extends State<TelaFeed> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listaDePosts(),
    );
  }

  Widget listaDePosts() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (context, index) {
          var postSeguido = _controladorUsuario.postsSeguidos[index];
          return PostagemWidget(
              avatar: null,
              username: null,
              name: null,
              timeAgo: null,
              text: null,
              comments: null,
              favorites: null);
        },
        itemCount: _controladorUsuario.postsSeguidos.length,
      ),
    );
  }
}
