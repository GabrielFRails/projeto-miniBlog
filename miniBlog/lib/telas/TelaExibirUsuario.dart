import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/util/DadosPerfilWidget.dart';
import 'package:miniBlog/util/ImagemPerfilWidget.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';

class TelaExibirUsuario extends StatefulWidget {
  const TelaExibirUsuario({Key key}) : super(key: key);

  @override
  _TelaExibirUsuarioState createState() => _TelaExibirUsuarioState();
}

class _TelaExibirUsuarioState extends State<TelaExibirUsuario>
    with AfterLayoutMixin<TelaExibirUsuario> {
  BuildContext mMainContext;
  Usuario _usuarioRetorno = GetIt.I.get<ControladorUsuario>().mUsuarioRetorno;
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
          linkImagem: _usuarioRetorno.imagemPerfil,
          tamanhoImagem: 150,
        ),
        const SizedBox(height: 24),
        buildNomeUsuario(_usuarioRetorno),
        const SizedBox(height: 24),
        DadosPerfilWidget(),
        const SizedBox(height: 50),
        Center(
          child: BotaoPadrao(
            context: context,
            value: "Seguir",
            onTap: () {},
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: BotaoPadrao(
            context: context,
            value: "Ver Publicações",
            onTap: () {},
          ),
        ),
      ],
    ));
  }

  Widget buildNomeUsuario(Usuario usuario) => Column(
        children: [
          Text(
            '${_usuarioRetorno.nome}',
            //usuario.nome,
            style: GoogleFonts.nunitoSans(
                fontSize: 25,
                color: Color(0xff0D0D0D),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '${_usuarioRetorno.email}',
            //usuario.email,
            style: GoogleFonts.nunitoSans(
                color: Colors.grey, fontWeight: FontWeight.w300),
          )
        ],
      );

  @override
  void afterFirstLayout(BuildContext context) {}
}
