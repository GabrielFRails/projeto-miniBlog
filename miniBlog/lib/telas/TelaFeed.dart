import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Post.dart';
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
    Post post1 = new Post(conteudo: "nada");
    Post post2 = new Post(conteudo: "tudo");
    _controladorUsuario.postsSeguidos.add(post1);
    _controladorUsuario.postsSeguidos.add(post2);
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (context, index) {
          var postSeguido = _controladorUsuario.postsSeguidos[index];
          return Column(
            children: [
              PostagemWidget(
                  avatar: "https://picsum.photos/id/237/200/300",
                  username: "matheus",
                  name: "matueus",
                  timeAgo: "2",
                  text:
                      "dfadfdafadafnsjkldkkkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdajsdfknh",
                  comments: "3",
                  favorites: "4"),
              Divider(
                thickness: 1,
              )
            ],
          );
        },
        //itemCount: _controladorUsuario.postsSeguidos.length,
        itemCount: 0,
      ),
    );
  }
}
