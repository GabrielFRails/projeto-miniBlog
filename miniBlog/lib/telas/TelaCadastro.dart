import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/animacao/FadeAnimacao.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
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
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
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
                    SvgPicture.asset(
                      'assets/icons/person.svg',
                      height: size.height * 0.35,
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
                                onChanged: _controladorUsuario.setNome,
                              );
                            }),
                            Observer(builder: (_) {
                              return TextFieldPadrao(
                                prefix: Icon(
                                  Icons.alternate_email,
                                ),
                                hintText: "E-mail",
                                onChanged: _controladorUsuario.setEmail,
                              );
                            }),
                            Observer(builder: (_) {
                              return TextFieldPadrao(
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
                            value: "Concluir Cadastro",
                            onTap: () {},
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
