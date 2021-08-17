import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniBlog/animacao/FadeAnimacao.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';
import 'package:miniBlog/widgets_padrao/TextFieldPadrao.dart';

class TelaEditarPerfil extends StatefulWidget {
  TelaEditarPerfil({Key key}) : super(key: key);

  @override
  _TelaEditarPerfilState createState() => _TelaEditarPerfilState();
}

class _TelaEditarPerfilState extends State<TelaEditarPerfil> {
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
                    1.7,
                    SvgPicture.asset(
                      'assets/icons/person1.svg',
                      height: size.height * 0.35,
                    )),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimacao(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                TextFieldPadrao(
                                  hintText: "Editar Nome",
                                  onChanged: (text) {},
                                ),
                                TextFieldPadrao(
                                    hintText: "Editar E-mail",
                                    onChanged: (text) {}),
                                TextFieldPadrao(
                                    hintText: "Editar Senha",
                                    onChanged: (text) {}),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimacao(2.0, Divider()),
                      FadeAnimacao(
                          1.9,
                          BotaoPadrao(
                            value: "Concluir Edição",
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
