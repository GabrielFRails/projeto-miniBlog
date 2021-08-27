import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/animacao/FadeAnimacao.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';
import 'package:miniBlog/widgets_padrao/IconButtonPadrao.dart';
import 'package:miniBlog/widgets_padrao/TextFieldPadrao.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  Usuario _usuario = Usuario();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    'assets/icons/person1.svg',
                    height: size.height * 0.35,
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    FadeAnimacao(
                        1.7,
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              TextFieldPadrao(
                                prefix: Icon(
                                  Icons.alternate_email,
                                ),
                                hintText: "E-mail",
                                onChanged: (text) {
                                  _usuario.email = text;
                                },
                              ),
                              TextFieldPadrao(
                                prefix: Icon(
                                  Icons.lock,
                                ),
                                hintText: "Senha",
                                obscureText: _controladorUsuario.obscureText,
                                maxLines: 1,
                                onChanged: (text) {
                                  _usuario.senha = text;
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
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimacao(
                        1.8,
                        BotaoPadrao(
                            value: "Entrar",
                            onTap: () {
                              _controladorUsuario.autenticarUsuario(
                                _usuario,
                                sucesso: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "/telaPrincipal",
                                      (Route<dynamic> route) => false);
                                },
                                erro: (mensagem) {
                                  Fluttertoast.showToast(
                                      msg: mensagem == "Unauthorized"
                                          ? "E-mail ou senha incorretos"
                                          : mensagem,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 10);
                                },
                              );
                            })),
                    SizedBox(height: 16),
                    FadeAnimacao(
                      2.0,
                      BotaoPadrao(
                        value: "Quero Me Cadastrar",
                        onTap: () {
                          Navigator.pushNamed(context, "/telaCadastro");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
