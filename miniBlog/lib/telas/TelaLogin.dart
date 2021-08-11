import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/animacao/FadeAnimacao.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';
import 'package:miniBlog/widgets_padrao/TextFieldPadrao.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  //ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  Usuario _usuario = new Usuario();

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
                SvgPicture.asset(
                  'assets/icons/person1.svg',
                  height: size.height * 0.40,
                )),
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
                            TextFieldPadrao(
                              title: "Email",
                              onChanged: (text) {
                                _usuario.email = text;
                              },
                            ),
                            TextFieldPadrao(
                              title: "Senha",
                              obscureText: true,
                              maxLines: 1,
                              onChanged: (text) {
                                _usuario.senha = text;
                              },
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
