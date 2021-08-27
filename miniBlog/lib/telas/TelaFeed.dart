import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniBlog/controladores/ControladorPost.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/enums/StatusConsulta.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/util/UtilStyle.dart';
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
  Usuario _usuarioLogado = GetIt.I.get<ControladorUsuario>().mUsuarioLogado;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _consultarOFeed());
    _controladorUsuario.filtrarUsuarios("");
    super.initState();
  }

  _consultarOFeed() {
    _controladorPost.consultarOFeed(sucesso: () {
      _refreshController.refreshCompleted();
    }, erro: (mensagem) {
      UtilDialogo.exibirAlerta(context,
          mensagem: "Houve um erro, por favor tente novamente");
      _refreshController.refreshFailed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff248FE0),
        onPressed: () {
          Navigator.of(context).pushNamed("/telaPostar");
        },
        child: Icon(
          FontAwesomeIcons.featherAlt,
          color: Colors.white,
        ),
      ),
      body: SmartRefresher(
          onRefresh: _consultarOFeed,
          controller: _refreshController,
          header: MaterialClassicHeader(
            color: Colors.black54,
          ),
          child: listaDePosts()),
    );
  }

  Widget listaDePosts() {
    return SingleChildScrollView(
      child: Observer(builder: (_) {
        switch (_controladorPost.statusConsultaFeed) {
          case StatusConsulta.CARREGANDO:
            _controladorUsuario.filtrarUsuarios("");
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff2869FC)),
                        backgroundColor: Color(0xff248FE0)),
                  ),
                ],
              ),
            );
            break;
          case StatusConsulta.ERRO:
            _controladorUsuario.filtrarUsuarios("");
            return Container();
            break;
          case StatusConsulta.SUCESSO:
            _controladorUsuario.filtrarUsuarios("");
            return _controladorPost.postsSeguidos.length != 0
                ? Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        var postSeguido = _controladorPost.postsSeguidos[index];
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
                              favorites: _controladorPost
                                  .postsSeguidos[index].qntdLike,
                              onPressedLike: () {
                                _controladorPost.postsSeguidos[index].temLike
                                    ? _controladorPost.removerLike(
                                        postSeguido.id, sucesso: () {
                                        setState(() {
                                          _controladorPost
                                              .postsSeguidos[index].qntdLike--;
                                        });
                                      })
                                    : _controladorPost.darLike(postSeguido.id,
                                        sucesso: () {
                                        setState(() {
                                          _controladorPost
                                              .postsSeguidos[index].qntdLike++;
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
                                  postSeguido.usuario.id == _usuarioLogado.id
                                      ? Navigator.pushNamed(
                                          context, "/telaPerfil")
                                      : Navigator.pushNamed(
                                          context, "/telaExibirPerfil");
                                }, erro: (mensagem) {
                                  UtilDialogo.exibirAlerta(context,
                                      titulo: "Ops! Erro ao exibir o perfil",
                                      mensagem: mensagem);
                                });
                              },
                              color:
                                  _controladorPost.postsSeguidos[index].temLike
                                      ? Colors.red
                                      : UtilStyle.iconColor(),
                            ),
                            Divider(
                              thickness: 1,
                              height: 1,
                            )
                          ],
                        );
                      },
                      itemCount: _controladorPost.postsSeguidos.length,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Siga alguém ou poste algo para ver seu feed",
                          style: GoogleFonts.nunitoSans(fontSize: 14),
                        ),
                      ],
                    ),
                  );

            break;
          default:
            _controladorUsuario.filtrarUsuarios("");
            return Text("default");
            break;
        }
      }),
    );
  }
}
