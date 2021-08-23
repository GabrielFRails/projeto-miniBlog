import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/animacao/FadeAnimacao.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/controladores/ControladorWidget.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/util/ImagemWidget.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';
import 'package:miniBlog/widgets_padrao/IconButtonPadrao.dart';
import 'package:miniBlog/widgets_padrao/TextFieldPadrao.dart';
import 'package:flutter_svg/svg.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key key}) : super(key: key);

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  List<String> linksImagens = [
    'https://i.pinimg.com/564x/69/69/cc/6969cc9617f5c65db170ef2a2f5a83a9.jpg', //tanjiro
    'https://i.pinimg.com/564x/a4/8e/55/a48e550b33dbda21217e8141a96db06e.jpg', //megumi
    'https://i.pinimg.com/564x/a3/b9/52/a3b952d943dffc98eff5f07101f7fe6c.jpg', //todoroki
    'https://i.pinimg.com/564x/2c/51/18/2c5118c504d8849020c73663924edade.jpg', //Sasuke
    'https://i.pinimg.com/564x/21/1c/63/211c636a2ac3a13599fae6077da0d17a.jpg', //Nejire Hado
    'https://i.pinimg.com/564x/9f/00/4c/9f004cecca316b9881561675549a3ce0.jpg', //Nobara
    'https://png.pngitem.com/pimgs/s/177-1772824_hinata-render-by-darkfke0o-hyuuga-hinata-hd-png.png', //hinata
    'https://i.pinimg.com/564x/bf/9e/05/bf9e0570ab4706e07ce3ce95662bbb3d.jpg', //sakura
    'https://www.imagenspng.com.br/wp-content/uploads/2020/10/among-us-white-png-01.png'
  ];
  bool selecionouImagem0 = false;
  bool selecionouImagem1 = false;
  bool selecionouImagem2 = false;
  bool selecionouImagem3 = false;
  bool selecionouImagem4 = false;
  bool selecionouImagem5 = false;
  bool selecionouImagem6 = false;
  bool selecionouImagem7 = false;
  bool selecionouImagem8 = false;

  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  ControladorWidget _controladorWidget = GetIt.I.get<ControladorWidget>();
  Usuario usuario = Usuario();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.04),
                FadeAnimacao(
                    1.1,
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: SvgPicture.asset(
                        'assets/icons/person.svg',
                        height: size.height * 0.35,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimacao(
                        1.8,
                        Column(
                          children: <Widget>[
                            Observer(builder: (_) {
                              return TextFieldPadrao(
                                prefix: Icon(Icons.person_outline),
                                hintText: "Nome Completo",
                                onChanged: (text) {
                                  usuario.nome = text;
                                },
                              );
                            }),
                            Observer(builder: (_) {
                              return TextFieldPadrao(
                                prefix: Icon(
                                  Icons.alternate_email,
                                ),
                                hintText: "E-mail",
                                onChanged: (text) {
                                  usuario.email = text;
                                },
                              );
                            }),
                            Observer(builder: (_) {
                              return TextFieldPadrao(
                                prefix: Icon(Icons.lock),
                                hintText: "Senha",
                                obscureText: _controladorUsuario.obscureText,
                                maxLines: 1,
                                onChanged: (text) {
                                  usuario.senha = text;
                                },
                                suffix: IconButtonPadrao(
                                  radius: 32,
                                  iconData: _controladorUsuario.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  onTap: () {
                                    _controladorUsuario.changeVisibility();
                                  },
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimacao(
                          1.9,
                          BotaoPadrao(
                            value: "Definir Foto de Perfil",
                            onTap: () {
                              takeChosenImage(context);
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      FadeAnimacao(
                          1.9,
                          BotaoPadrao(
                            value: "Concluir Cadastro",
                            onTap: () {
                              _controladorUsuario.cadastrarUsuario(usuario,
                                  sucesso: () {
                                UtilDialogo.exibirAlerta(context,
                                    titulo: "Cadastro ok!", onTap: () {
                                      Navigator.pushReplacementNamed(context, "/telaLogin");
                                    });
                                
                              }, erro: (mensagem) {
                                UtilDialogo.exibirAlerta(context,
                                    titulo: "Ops deu erro no Login",
                                    mensagem: mensagem);
                              });
                            },
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  takeChosenImage(
    BuildContext context,
  ) {
    var chooseImage = Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Color.fromRGBO(81, 85, 90, 1),
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
          backgroundColor: Colors.white,
          title: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Color.fromRGBO(81, 85, 90, 1),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(child: Text('Definir Foto de Perfil')),
              ],
            ),
          ),
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (_) {
                      return ImagemWidget(
                        isSelecionado: _controladorWidget.selecionouImagem0,
                        linkImagem: linksImagens[0],
                        onTap: () {
                          setState(() {
                            _controladorWidget.selecionouImagem0 =
                                !_controladorWidget.selecionouImagem0;
                            _controladorWidget.selecionouImagem1 = false;
                            _controladorWidget.selecionouImagem2 = false;
                            _controladorWidget.selecionouImagem3 = false;
                            _controladorWidget.selecionouImagem4 = false;
                            _controladorWidget.selecionouImagem5 = false;
                            _controladorWidget.selecionouImagem6 = false;
                            _controladorWidget.selecionouImagem7 = false;
                            _controladorWidget.selecionouImagem8 = false;
                          });
                          usuario.imagemPerfil = linksImagens[0];
                        },
                        tamanhoImagem: 70,
                      );
                    }),
                    Observer(builder: (_) {
                      return ImagemWidget(
                        isSelecionado: _controladorWidget.selecionouImagem1,
                        linkImagem: linksImagens[1],
                        onTap: () {
                          setState(() {
                            _controladorWidget.selecionouImagem0 = false;
                            _controladorWidget.selecionouImagem1 =
                                !_controladorWidget.selecionouImagem1;
                            _controladorWidget.selecionouImagem2 = false;
                            _controladorWidget.selecionouImagem3 = false;
                            _controladorWidget.selecionouImagem4 = false;
                            _controladorWidget.selecionouImagem5 = false;
                            _controladorWidget.selecionouImagem6 = false;
                            _controladorWidget.selecionouImagem7 = false;
                            _controladorWidget.selecionouImagem8 = false;
                          });
                          usuario.imagemPerfil = linksImagens[1];
                        },
                        tamanhoImagem: 70,
                      );
                    }),
                    Observer(builder: (_) {
                      return ImagemWidget(
                        isSelecionado: _controladorWidget.selecionouImagem2,
                        linkImagem: linksImagens[2],
                        onTap: () {
                          setState(() {
                            _controladorWidget.selecionouImagem0 = false;
                            _controladorWidget.selecionouImagem1 = false;
                            _controladorWidget.selecionouImagem2 = true;
                            _controladorWidget.selecionouImagem3 = false;
                            _controladorWidget.selecionouImagem4 = false;
                            _controladorWidget.selecionouImagem5 = false;
                            _controladorWidget.selecionouImagem6 = false;
                            _controladorWidget.selecionouImagem7 = false;
                            _controladorWidget.selecionouImagem8 = false;
                          });
                          usuario.imagemPerfil = linksImagens[2];
                        },
                        tamanhoImagem: 70,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (_) {
                      return ImagemWidget(
                        isSelecionado: _controladorWidget.selecionouImagem3,
                        linkImagem: linksImagens[3],
                        onTap: () {
                          setState(() {
                            _controladorWidget.selecionouImagem0 = false;
                            _controladorWidget.selecionouImagem1 = false;
                            _controladorWidget.selecionouImagem2 = false;
                            _controladorWidget.selecionouImagem3 = true;
                            _controladorWidget.selecionouImagem4 = false;
                            _controladorWidget.selecionouImagem5 = false;
                            _controladorWidget.selecionouImagem6 = false;
                            _controladorWidget.selecionouImagem7 = false;
                            _controladorWidget.selecionouImagem8 = false;
                          });
                          usuario.imagemPerfil = linksImagens[3];
                        },
                        tamanhoImagem: 70,
                      );
                    }),
                    Observer(builder: (_) {
                      return ImagemWidget(
                        isSelecionado: _controladorWidget.selecionouImagem4,
                        linkImagem: linksImagens[4],
                        onTap: () {
                          setState(() {
                            _controladorWidget.selecionouImagem0 = false;
                            _controladorWidget.selecionouImagem1 = false;
                            _controladorWidget.selecionouImagem2 = false;
                            _controladorWidget.selecionouImagem3 = false;
                            _controladorWidget.selecionouImagem4 = true;
                            _controladorWidget.selecionouImagem5 = false;
                            _controladorWidget.selecionouImagem6 = false;
                            _controladorWidget.selecionouImagem7 = false;
                            _controladorWidget.selecionouImagem8 = false;
                          });
                          usuario.imagemPerfil = linksImagens[4];
                        },
                        tamanhoImagem: 70,
                      );
                    }),
                    Observer(builder: (_) {
                      return ImagemWidget(
                        isSelecionado: _controladorWidget.selecionouImagem5,
                        linkImagem: linksImagens[5],
                        onTap: () {
                          setState(() {
                            _controladorWidget.selecionouImagem0 = false;
                            _controladorWidget.selecionouImagem1 = false;
                            _controladorWidget.selecionouImagem2 = false;
                            _controladorWidget.selecionouImagem3 = false;
                            _controladorWidget.selecionouImagem4 = false;
                            _controladorWidget.selecionouImagem5 = true;
                            _controladorWidget.selecionouImagem6 = false;
                            _controladorWidget.selecionouImagem7 = false;
                            _controladorWidget.selecionouImagem8 = false;
                          });
                          usuario.imagemPerfil = linksImagens[5];
                        },
                        tamanhoImagem: 70,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(builder: (_) {
                      return ImagemWidget(
                        isSelecionado: _controladorWidget.selecionouImagem6,
                        linkImagem: linksImagens[6],
                        onTap: () {
                          setState(() {
                            _controladorWidget.selecionouImagem0 = false;
                            _controladorWidget.selecionouImagem1 = false;
                            _controladorWidget.selecionouImagem2 = false;
                            _controladorWidget.selecionouImagem3 = false;
                            _controladorWidget.selecionouImagem4 = false;
                            _controladorWidget.selecionouImagem5 = false;
                            _controladorWidget.selecionouImagem6 = true;
                            _controladorWidget.selecionouImagem7 = false;
                            _controladorWidget.selecionouImagem8 = false;
                          });
                          usuario.imagemPerfil = linksImagens[6];
                        },
                        tamanhoImagem: 70,
                      );
                    }),
                    Observer(builder: (_) {
                      return ImagemWidget(
                        isSelecionado: _controladorWidget.selecionouImagem7,
                        linkImagem: linksImagens[7],
                        onTap: () {
                          setState(() {
                            _controladorWidget.selecionouImagem0 = false;
                            _controladorWidget.selecionouImagem1 = false;
                            _controladorWidget.selecionouImagem2 = false;
                            _controladorWidget.selecionouImagem3 = false;
                            _controladorWidget.selecionouImagem4 = false;
                            _controladorWidget.selecionouImagem5 = false;
                            _controladorWidget.selecionouImagem6 = false;
                            _controladorWidget.selecionouImagem7 = true;
                            _controladorWidget.selecionouImagem8 = false;
                          });
                          usuario.imagemPerfil = linksImagens[7];
                        },
                        tamanhoImagem: 70,
                      );
                    }),
                    Observer(builder: (_) {
                      return ImagemWidget(
                        isSelecionado: _controladorWidget.selecionouImagem8,
                        linkImagem: linksImagens[8],
                        onTap: () {
                          setState(() {
                            _controladorWidget.selecionouImagem0 = false;
                            _controladorWidget.selecionouImagem1 = false;
                            _controladorWidget.selecionouImagem2 = false;
                            _controladorWidget.selecionouImagem3 = false;
                            _controladorWidget.selecionouImagem4 = false;
                            _controladorWidget.selecionouImagem5 = false;
                            _controladorWidget.selecionouImagem6 = false;
                            _controladorWidget.selecionouImagem7 = false;
                            _controladorWidget.selecionouImagem8 = true;
                          });
                          usuario.imagemPerfil = linksImagens[8];
                        },
                        tamanhoImagem: 70,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BotaoPadrao(
                    value: "Definir",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
          actions: [],
        ));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return chooseImage;
      },
    );
  }
}
