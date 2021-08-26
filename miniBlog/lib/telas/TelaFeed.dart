import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorPost.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/telaPostar");
        },
        backgroundColor: Colors.green,
        child: Icon(FontAwesomeIcons.featherAlt),
      ),
      body: SmartRefresher(
          enablePullDown: true,
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
            return _controladorPost.postsSeguidos.length != 0
                ? ListView.builder(
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
                            visible: _controladorUsuario.isCriador(
                                _controladorUsuario.mUsuarioLogado.id,
                                postSeguido.usuario.id),
                            context: context,
                            avatar: "${postSeguido.usuario.imagemPerfil}",
                            username: "${postSeguido.usuario.nome}",
                            timeAgo: "${postSeguido.data}",
                            text: "${postSeguido.conteudo}",
                            comments: postSeguido.qntdComentario,
                            onPressedComment: () {
                              _controladorPost.postId = postSeguido.id;
                              Navigator.of(context)
                                  .pushNamed("/telaComentario");
                            },
                            favorites: postSeguido.qntdLike,
                            onPressedLike: () {
                              postSeguido.liked
                                  ? _controladorPost.removerLike(postSeguido.id,
                                      sucesso: () {
                                      setState(() {
                                        postSeguido.qntdLike--;
                                      });
                                    })
                                  : _controladorPost.darLike(postSeguido.id,
                                      sucesso: () {
                                      setState(() {
                                        postSeguido.qntdLike++;
                                      });
                                    });
                            },
                            onPressedEdit: () {
                              _controladorPost.postEditar = postSeguido;
                              Navigator.of(context)
                                  .pushNamed("/telaEditarPost");
                            },
                            onPressedDelete: () {
                              _controladorPost.excluirPostagem(postSeguido.id,
                                  sucesso: () {
                                _consultarOFeed();
                                Navigator.of(context).pop();
                              }, erro: (msg) {
                                UtilDialogo.exibirAlerta(context,
                                    mensagem: "Houve um erro",
                                    titulo: "Ops", onTap: () {
                                  Navigator.of(context).pop();
                                });
                              });
                            },
                            onTap: () {
                              int auxiliarId =
                                  int.parse(postSeguido.usuario.id);
                              _controladorUsuario.buscaUsuario(auxiliarId,
                                  sucesso: () {
                                Navigator.pushNamed(
                                    context, "/telaExibirPerfil");
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
                  )
                : Container(
                    child: Text("Sem posts"),
                  );
            break;
          default:
            return Text("default");
            break;
        }
      }),
    );
  }
}
