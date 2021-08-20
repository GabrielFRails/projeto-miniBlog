import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorPost.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Comentario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/widgets_padrao/ComentarioWidget.dart';

class TelaComentario extends StatefulWidget {
  const TelaComentario({Key key}) : super(key: key);

  @override
  _TelaComentarioState createState() => _TelaComentarioState();
}

class _TelaComentarioState extends State<TelaComentario> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  ControladorPost _controladorPost = GetIt.I.get<ControladorPost>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController controladorComentario = TextEditingController();

  Comentario c1 = new Comentario(
      conteudo: "blablabla", criador: new Usuario(nome: "sergio"));
  Comentario c2 = new Comentario(
      conteudo: "blablablaqqqqqq", criador: new Usuario(nome: "karla"));
  Comentario c3 = new Comentario(
      conteudo: "blablablaasdf", criador: new Usuario(nome: "ramos"));

  @override
  void initState() {
    _controladorPost.comentarios.add(c1);
    _controladorPost.comentarios.add(c2);
    _controladorPost.comentarios.add(c3);
    super.initState();
  }
  /*_controladorPost.comentarios.add(c1);
    _controladorPost.comentarios.add(c2);
    _controladorPost.comentarios.add(c3);*/

  Widget comentariosChild() {
    return ListView.builder(
        itemCount: _controladorPost.comentarios.length,
        itemBuilder: (context, index) {
          var comentario = _controladorPost.comentarios[index];
          return Column(
            children: [
              Container(
                  child: ComentarioWidget(
                context: context,
                avatar: "https://picsum.photos/id/237/200/300",
                username: "matheus",
                timeAgo: "2",
                text: "${comentario.conteudo}",
              )),
              Divider(
                height: 1,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Comentario comentario =
        Comentario(criador: _controladorUsuario.usuarioLogado);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Página de comentário",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff276B69),
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
          child: comentariosChild(),
          labelText: 'Adicione um comentário',
          withBorder: false,
          errorText: "O campo não pode ser vazio",
          sendButtonMethod: () {
            if (formKey.currentState.validate()) {
              setState(() {
                comentario.conteudo = controladorComentario.text;
                comentario.criador.nome = "Carlos";
                _controladorPost.comentarios.insert(0, comentario);
              });
              controladorComentario.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: controladorComentario,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
