import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorPost.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Comentario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/enums/StatusConsulta.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/util/UtilStyle.dart';
import 'package:miniBlog/widgets_padrao/ComentarioWidget.dart';

class TelaComentario extends StatefulWidget {
  const TelaComentario({Key key}) : super(key: key);

  @override
  _TelaComentarioState createState() => _TelaComentarioState();
}

class _TelaComentarioState extends State<TelaComentario> {
  ControladorPost _controladorPost = GetIt.I.get<ControladorPost>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _controladorComentario = TextEditingController();
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  Usuario _usuarioLogado = GetIt.I.get<ControladorUsuario>().mUsuarioLogado;
  Comentario comentarioAdicionar = new Comentario();
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _consultarComentarios());
    super.initState();
  }

  _consultarComentarios() {
    _controladorPost.consultarComentarios(_controladorPost.postId, sucesso: () {
      Navigator.pop(context);
    }, erro: (mensagem) {
      UtilDialogo.exibirAlerta(context,
          mensagem: "nao deu bom", titulo: "erro");
    }, carregando: () {
      UtilDialogo.showLoading(context);
    });
  }

  Widget comentariosChild() {
    return Observer(builder: (_) {
      switch (_controladorPost.statusConsultaComentario) {
        case StatusConsulta.SUCESSO:
          return _controladorPost.comentariosPost.length != 0
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: _controladorPost.comentariosPost.length,
                  itemBuilder: (context, index) {
                    var comentario = _controladorPost.comentariosPost[index];
                    return Column(
                      children: [
                        Container(
                            child: ComentarioWidget(
                          context: context,
                          avatar: "${comentario.usuario.imagemPerfil}",
                          username: "${comentario.usuario.nome}",
                          timeAgo: "2",
                          text: "${comentario.conteudo}",
                          visible: _controladorUsuario.isCriador(
                              _controladorUsuario.mUsuarioLogado.id,
                              comentario.usuario.id),
                          onPressedDelete: () {
                            _controladorPost.excluirComentario(
                                comentario.idComentario, sucesso: () {
                              Navigator.of(context).pop();
                              setState(() {});
                            }, erro: (msg) {
                              UtilDialogo.exibirAlerta(context,
                                  mensagem: msg, titulo: "ops!");
                            });
                          },
                        )),
                        Divider(
                          height: 1,
                        )
                      ],
                    );
                  })
              : Container(
                  child: Text("Sem comentarios"),
                );
          break;
        case StatusConsulta.ERRO:
          return Text("Desculpe, falhamos");
          break;
        case StatusConsulta.CARREGANDO:
          return Text("Carregando");
          break;
        default:
          return Container();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                "/telaPrincipal", (Route<dynamic> route) => false);
          },
        ),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Página de comentário",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff276B69),
      ),
      body: Container(
        child: CommentBox(
          userImage: _usuarioLogado.imagemPerfil,
          child: comentariosChild(),
          labelText: 'Adicione um comentário',
          withBorder: false,
          errorText: "O campo não pode ser vazio",
          sendButtonMethod: () {
            if (formKey.currentState.validate()) {
              comentarioAdicionar.conteudo = _controladorComentario.text;
              comentarioAdicionar.idPostagem = _controladorPost.postId;
              _controladorPost.cadastrarComentario(comentarioAdicionar,
                  sucesso: () {
                setState(() {
                  _controladorComentario.text = "";
                });
              });
            }
          },
          formKey: formKey,
          commentController: _controladorComentario,
          backgroundColor: UtilStyle.commentBox(),
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
