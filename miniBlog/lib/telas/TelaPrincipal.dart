import 'package:flutter/material.dart';
import 'package:miniBlog/animacao/FadeAnimacao.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';
import 'package:miniBlog/widgets_padrao/TextFieldPadrao.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
            Container(), //preencher container depois com as imagens
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(children: <Widget>[
                FadeAnimacao(
                    1.1,
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
                      child: Column(children: <Widget>[
                        FadeAnimacao(
                            1.1,
                            TextFieldPadrao(
                              title: "E-mail",
                            )),
                        FadeAnimacao(
                            1.1, TextFieldPadrao(title: "Nome Completo")),
                        FadeAnimacao(1.1, TextFieldPadrao(title: "Senha")),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimacao(
                            1.1,
                            BotaoPadrao(
                              value: "Concluir Cadastro",
                            )),
                      ]),
                    ))
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
