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
  Post post1 =
      new Post(conteudo: "nadaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
  Post post2 = new Post(conteudo: "tudo");

  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();

  @override
  void initState() {
    _controladorUsuario.postsSeguidos.add(post1);
    _controladorUsuario.postsSeguidos.add(post2);
    super.initState();
  }

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
          return Column(
            children: [
              PostagemWidget(
                  context: context,
                  avatar: "https://picsum.photos/id/237/200/300",
                  username: "matheus",
                  timeAgo: "2",
                  text: "${postSeguido.conteudo}",
                  comments: "3",
                  favorites: "4"),
              Divider(
                thickness: 1,
                height: 1,
              )
            ],
          );
        },
        itemCount: _controladorUsuario.postsSeguidos.length,
        //itemCount: 0,
      ),
    );
  }
}
