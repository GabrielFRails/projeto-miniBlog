import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniBlog/animacao/FadeAnimacao.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
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
  Usuario _usuario = new Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: null,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 25,
                      width: 100,
                      height: 200,
                      child: FadeAnimacao(
                          1,
                          Container(
                            decoration: null,
                          ))),
                  Positioned(
                      left: 150,
                      width: 100,
                      height: 170,
                      child: FadeAnimacao(
                          1.2,
                          Container(
                            decoration: null,
                          ))),
                  Positioned(
                      right: 40,
                      width: 80,
                      top: 35,
                      height: 150,
                      child: FadeAnimacao(
                          1.3,
                          FadeAnimacao(
                              1.5,
                              Container(
                                decoration: null,
                              )))),
                  Positioned(
                    child: FadeAnimacao(
                        1.5,
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.nunitoSans(
                                  color: Colors.grey,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  FadeAnimacao(
                      1.7,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: null,
                        child: Column(
                          children: <Widget>[
                            Observer(
                              builder: (_) => TextFieldPadrao(
                                prefix: Icon(
                                  Icons.alternate_email,
                                ),
                                hintText: "Email",
                                onChanged: _controladorUsuario.setEmail,
                              ),
                            ),
                            Observer(
                              builder: (_) => TextFieldPadrao(
                                prefix: Icon(Icons.lock),
                                hintText: "Senha",
                                obscureText: _controladorUsuario.obscureText,
                                maxLines: 1,
                                onChanged: _controladorUsuario.setSenha,
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
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimacao(1.8, BotaoPadrao(value: "Entrar", onTap: () {})),
                  FadeAnimacao(2.0, Divider()),
                  FadeAnimacao(
                      2.0,
                      BotaoPadrao(
                        value: "Quero Me Cadastrar",
                        onTap: () {
                          Navigator.pushNamed(context, "/telaCadastro");
                        },
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
