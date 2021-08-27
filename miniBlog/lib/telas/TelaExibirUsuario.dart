import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniBlog/controladores/ControladorSeguindo.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/util/DadosPerfilWidget.dart';
import 'package:miniBlog/util/ImagemPerfilWidget.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';

class TelaExibirUsuario extends StatefulWidget {
  const TelaExibirUsuario({Key key}) : super(key: key);

  @override
  _TelaExibirUsuarioState createState() => _TelaExibirUsuarioState();
}

class _TelaExibirUsuarioState extends State<TelaExibirUsuario>
    with AfterLayoutMixin<TelaExibirUsuario> {
  BuildContext mMainContext;
  Usuario _usuarioRetorno = GetIt.I.get<ControladorUsuario>().mUsuarioRetorno;
  Usuario _usuarioLogado = GetIt.I.get<ControladorUsuario>().mUsuarioLogado;
  ControladorSeguindo _controladorSeguindo = GetIt.I.get<ControladorSeguindo>();
  String situacaoAtual = "";
  bool carregando = true;

  @override
  void initState() {
    _controladorSeguindo.listarSeguidores(
        email: _usuarioRetorno.email,
        carregando: () {
          carregando = true;
        },
        sucesso: () {
          _controladorSeguindo.listarSeguindo(
              email: _usuarioRetorno.email,
              carregando: () {
                carregando = true;
              },
              sucesso: () {
                _controladorSeguindo.isUsuarioLogadoNaoSeguindo(_usuarioLogado)
                    ? situacaoAtual = "Seguir"
                    : situacaoAtual = "Deixar de Seguir";
                carregando = false;
                setState(() {});
              });
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: carregando
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(25),
                  physics: BouncingScrollPhysics(),
                  children: [
                    ImagemPerfilWidget(
                      linkImagem: _usuarioRetorno.imagemPerfil,
                      tamanhoImagem: 150,
                    ),
                    const SizedBox(height: 24),
                    buildNomeUsuario(_usuarioRetorno),
                    const SizedBox(height: 24),
                    DadosPerfilWidget(
                      numFollow:
                          GetIt.I.get<ControladorSeguindo>().numeroFollow,
                      numFollowers:
                          GetIt.I.get<ControladorSeguindo>().numeroFollowers,
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: BotaoPadrao(
                        context: context,
                        value: situacaoAtual,
                        onTap: () {
                          _controladorSeguindo
                                  .isUsuarioLogadoNaoSeguindo(_usuarioLogado)
                              ? _controladorSeguindo.seguirUsuario(
                                  int.parse(_usuarioRetorno.id), sucesso: () {
                                  _controladorSeguindo.listarSeguidores(
                                      email: _usuarioRetorno.email,
                                      sucesso: () {
                                        situacaoAtual = "Deixar de Seguir";
                                        UtilDialogo.exibirAlerta(context,
                                            titulo: "Sucesso",
                                            mensagem:
                                                "Você Seguiu ${_usuarioRetorno.nome}");
                                        setState(() {});
                                      });
                                }, erro: (mensagem) {
                                  UtilDialogo.exibirAlerta(context,
                                      titulo:
                                          "Vish deu pau pra seguir ${_usuarioRetorno.nome}",
                                      mensagem: mensagem);
                                })
                              : _controladorSeguindo.unfollowUsuario(
                                  int.parse(_usuarioRetorno.id), sucesso: () {
                                  _controladorSeguindo.listarSeguidores(
                                      email: _usuarioRetorno.email,
                                      sucesso: () {
                                        situacaoAtual = "Seguir";
                                        UtilDialogo.exibirAlerta(context,
                                            titulo: "Sucesso",
                                            mensagem:
                                                "Você deixou de Seguir ${_usuarioRetorno.nome}");
                                        setState(() {});
                                      });
                                }, erro: (mensagem) {
                                  UtilDialogo.exibirAlerta(context,
                                      titulo: "Vish deu Pau",
                                      mensagem: mensagem);
                                });
                        },
                      ),
                    ),
                    /* const SizedBox(height: 24),
                    Center(
                      child: BotaoPadrao(
                        context: context,
                        value: "Ver Publicações",
                        onTap: () {},
                      ),
                    ), */
                  ],
                ),
              ));
  }

  Widget buildNomeUsuario(Usuario usuario) => Column(
        children: [
          Text(
            '${_usuarioRetorno.nome}',
            style: GoogleFonts.nunitoSans(
                fontSize: 25,
                color: Color(0xff0D0D0D),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '${_usuarioRetorno.email}',
            style: GoogleFonts.nunitoSans(
                color: Colors.grey, fontWeight: FontWeight.w300),
          )
        ],
      );

  @override
  void afterFirstLayout(BuildContext context) {}
}
