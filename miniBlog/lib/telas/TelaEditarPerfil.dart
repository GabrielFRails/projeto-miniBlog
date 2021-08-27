import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/animacao/FadeAnimacao.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/util/UtilStyle.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';
import 'package:miniBlog/widgets_padrao/TextFieldPadrao.dart';

class TelaEditarPerfil extends StatefulWidget {
  TelaEditarPerfil({Key key}) : super(key: key);

  @override
  _TelaEditarPerfilState createState() => _TelaEditarPerfilState();
}

class _TelaEditarPerfilState extends State<TelaEditarPerfil> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  Usuario _usuarioLogado = GetIt.I.get<ControladorUsuario>().mUsuarioLogado;
  Usuario _usuarioEditar = Usuario();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: UtilStyle.postContainer(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.08),
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
                            child: Column(
                              children: <Widget>[
                                TextFieldPadrao(
                                  hintText: "Editar Nome",
                                  onChanged: (text) {
                                    _usuarioEditar.nome = text;
                                  },
                                ),
                                TextFieldPadrao(
                                    hintText: "Editar E-mail",
                                    onChanged: (text) {
                                      _usuarioEditar.email = text;
                                    }),
                                TextFieldPadrao(
                                    hintText: "Editar Senha",
                                    onChanged: (text) {
                                      _usuarioEditar.senha = text;
                                    }),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimacao(
                          1.9,
                          BotaoPadrao(
                            value: "Concluir Edição",
                            onTap: () {
                              _controladorUsuario.editarUsuario(
                                  _usuarioEditar, int.parse(_usuarioLogado.id),
                                  sucesso: () {
                                UtilDialogo.exibirAlerta(
                                  context,
                                  titulo: "Edição Concluida!",
                                  mensagem:
                                      "Você precisará fazer login novamente",
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/telaLogin");
                                  },
                                );
                              }, erro: (mensagem) {
                                UtilDialogo.exibirAlerta(context,
                                    titulo: "Ops deu erro na Edição",
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
}
