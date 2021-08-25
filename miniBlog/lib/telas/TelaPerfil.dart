import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniBlog/controladores/ControladorSeguindo.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/util/DadosPerfilWidget.dart';
import 'package:miniBlog/util/ImagemPerfilWidget.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({Key key}) : super(key: key);

  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil>
    with AfterLayoutMixin<TelaPerfil> {
  BuildContext mMainContext;
  ControladorSeguindo _controladorSeguindo = GetIt.I.get<ControladorSeguindo>();
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  Usuario _usuarioLogado = GetIt.I.get<ControladorUsuario>().mUsuarioLogado;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: ListView(
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
          child: BotaoPadrao(
            context: context,
            value: "Editar o meu Perfil",
            onTap: () {
              Navigator.pushNamed(context, "/telaEditarPerfil");
            },
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: BotaoPadrao(
            context: context,
            value: "Testar Filtrar Usuários",
            onTap: () {
              _controladorUsuario.filtrarUsuarios("");
            },
          ),
        ),
      ],
    ));
  }

  Widget buildNomeUsuario(Usuario usuario) => Column(
        children: [
          Text(
            '${_usuarioLogado.nome}',
            //usuario.nome,
            style: GoogleFonts.nunitoSans(
                fontSize: 25,
                color: Color(0xff0D0D0D),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '${_usuarioLogado.email}',
            //usuario.email,
            style: GoogleFonts.nunitoSans(
                color: Colors.grey, fontWeight: FontWeight.w300),
          )
        ],
      );

  @override
  void afterFirstLayout(BuildContext context) {}
}
