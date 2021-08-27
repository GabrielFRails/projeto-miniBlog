import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniBlog/controladores/ControladorSeguindo.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/controladores/ControladorWidget.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/util/DadosPerfilWidget.dart';
import 'package:miniBlog/util/ImagemPerfilWidget.dart';
import 'package:miniBlog/util/UtilStyle.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({Key key}) : super(key: key);

  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  BuildContext mMainContext;
  ControladorSeguindo _controladorSeguindo = GetIt.I.get<ControladorSeguindo>();
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  ControladorWidget _controladorWidget = GetIt.I.get<ControladorWidget>();
  Usuario _usuarioLogado = GetIt.I.get<ControladorUsuario>().mUsuarioLogado;

  bool carregando = true;

  @override
  void initState() {
    _controladorSeguindo.listarSeguidores(
        email: _usuarioLogado.email,
        carregando: () {
          carregando = true;
        },
        sucesso: () {
          _controladorSeguindo.listarSeguindo(
              email: _usuarioLogado.email,
              carregando: () {
                carregando = true;
              },
              sucesso: () {
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
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xff2869FC)),
                    backgroundColor: Color(0xff248FE0)),
              )
            : ListView(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.all(25),
                physics: BouncingScrollPhysics(),
                children: [
                  ImagemPerfilWidget(
                    linkImagem: _usuarioLogado.imagemPerfil,
                    tamanhoImagem: 150,
                    onTap: () {
                      Navigator.pushNamed(context, "/telaEditarPerfil");
                    },
                  ),
                  const SizedBox(height: 24),
                  buildNomeUsuario(_usuarioLogado),
                  const SizedBox(height: 24),
                  DadosPerfilWidget(),
                  const SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: [
                        BotaoPadrao(
                          context: context,
                          value: "Editar o meu Perfil",
                          onTap: () {
                            Navigator.pushNamed(context, "/telaEditarPerfil");
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Observer(builder: (_) {
                          return BotaoPadrao(
                              value: "Mudar tema",
                              onTap: _controladorWidget.darkThemeSelected
                                  ? () {
                                      setState(() {
                                        _controladorUsuario.themeMode =
                                            ThemeMode.light;
                                        _controladorWidget.darkThemeSelected =
                                            !_controladorWidget
                                                .darkThemeSelected;
                                      });
                                    }
                                  : () {
                                      setState(() {
                                        _controladorUsuario.themeMode =
                                            ThemeMode.dark;
                                        _controladorWidget.darkThemeSelected =
                                            !_controladorWidget
                                                .darkThemeSelected;
                                      });
                                    });
                        }),
                      ],
                    ),
                  ),
                ],
              ));
  }

  Widget buildNomeUsuario(Usuario usuario) => Column(
        children: [
          Text(
            '${_usuarioLogado.nome}',
            style: UtilStyle.text(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '${_usuarioLogado.email}',
            style: GoogleFonts.nunitoSans(
                color: Colors.grey, fontWeight: FontWeight.w300),
          )
        ],
      );
}
