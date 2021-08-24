import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorPost.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/enums/StatusConsulta.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/widgets_padrao/PostagemWidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TelaFeed extends StatefulWidget {
  const TelaFeed({Key key}) : super(key: key);

  @override
  _TelaFeedState createState() => _TelaFeedState();
}

class _TelaFeedState extends State<TelaFeed> {
  ControladorPost _controladorPost = GetIt.I.get<ControladorPost>();
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  Usuario _usuarioRetorno = GetIt.I.get<ControladorUsuario>().mUsuarioRetorno;

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _consultarOFeed());
    super.initState();
  }

  _consultarOFeed() {
    _controladorPost.consultarOFeed(sucesso: () {
      Navigator.of(context).pop();
      _refreshController.refreshCompleted();
    }, erro: (mensagem) {
      UtilDialogo.exibirAlerta(context,
          mensagem: "nao deu bom", titulo: "erro");
      _refreshController.refreshFailed();
    }, carregando: () {
      UtilDialogo.showLoading(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _consultarOFeed,
          controller: _refreshController,
          header: MaterialClassicHeader(
            color: Colors.teal[200],
          ),
          child: listaDePosts()),
    );
  }

  Widget listaDePosts() {
    return SingleChildScrollView(
      child: Observer(builder: (_) {
        switch (_controladorPost.statusConsultaFeed) {
          case StatusConsulta.CARREGANDO:
            return Container();
            break;
          case StatusConsulta.ERRO:
            return Text("Desculpe, falhamos");
            break;
          case StatusConsulta.SUCESSO:
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                var postSeguido = _controladorPost.postsSeguidos[index];
                if (_controladorPost.postsSeguidos[index].liked == null) {
                  _controladorPost.postsSeguidos[index].liked = false;
                }
                return Column(
                  children: [
                    PostagemWidget(
                      context: context,
                      avatar: "${postSeguido.usuario.imagemPerfil}",
                      username: "${postSeguido.usuario.nome}",
                      timeAgo: "${postSeguido.data}",
                      text: "${postSeguido.conteudo}",
                      comments:
                          "${_controladorPost.getNumeroComentarios(postSeguido.id)}",
                      onPressedComment: () {
                        _controladorPost.postId = postSeguido.id;
                        Navigator.of(context).pushNamed("/telaComentario");
                      },
                      favorites: "4",
                      onPressedLike: () {
                        postSeguido.liked
                            ? _controladorPost.removerLike(postSeguido.id,
                                sucesso: () {
                                setState(() {});
                              })
                            : _controladorPost.darLike(postSeguido.id,
                                sucesso: () {
                                setState(() {});
                              });
                      },
                      onTap: () {
                        _controladorUsuario.buscaUsuario(
                            int.parse(postSeguido.usuario.id), sucesso: () {
                          Navigator.pushNamed(context, "/telaExibirPerfil");
                        }, erro: (mensagem) {
                          UtilDialogo.exibirAlerta(context,
                              titulo: "Ops! Erro ao exibir o perfil",
                              mensagem: mensagem);
                        });
                      },
                      color: _controladorPost.postsSeguidos[index].liked
                          ? Colors.red
                          : Colors.grey,
                    ),
                    Divider(
                      thickness: 1,
                      height: 1,
                    )
                  ],
                );
              },
              itemCount: _controladorPost.postsSeguidos.length,
            );
          default:
            return Text("default");
            break;
        }
      }),
    );
  }
}
