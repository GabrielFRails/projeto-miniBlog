import 'package:flutter/material.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/widgets_padrao/BotaoPadrao.dart';

import 'ImagemPerfilWidget.dart';

class UtilDialogo {
  static void exibirFotosPerfil(BuildContext context, Usuario novoUsuario) {
    List<String> linksImagens = [
      'https://i.pinimg.com/564x/69/69/cc/6969cc9617f5c65db170ef2a2f5a83a9.jpg', //tanjiro
      'https://i.pinimg.com/564x/a4/8e/55/a48e550b33dbda21217e8141a96db06e.jpg', //megumi
      'https://i.pinimg.com/564x/a3/b9/52/a3b952d943dffc98eff5f07101f7fe6c.jpg', //todoroki
      'https://i.pinimg.com/564x/2c/51/18/2c5118c504d8849020c73663924edade.jpg', //Sasuke
      'https://i.pinimg.com/564x/21/1c/63/211c636a2ac3a13599fae6077da0d17a.jpg', //Nejire Hado
      'https://i.pinimg.com/564x/9f/00/4c/9f004cecca316b9881561675549a3ce0.jpg', //Nobara
      'https://png.pngitem.com/pimgs/s/177-1772824_hinata-render-by-darkfke0o-hyuuga-hinata-hd-png.png', //hinata
      'https://i.pinimg.com/564x/bf/9e/05/bf9e0570ab4706e07ce3ce95662bbb3d.jpg', //sakura
    ];
    var alert = Container(
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
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    ImagemPerfilWidget(
                      linkImagem: linksImagens[0],
                      onTap: () {},
                      tamanhoImagem: 70,
                    ),
                    ImagemPerfilWidget(
                      linkImagem: linksImagens[1],
                      onTap: () {},
                      tamanhoImagem: 70,
                    ),
                    ImagemPerfilWidget(
                      linkImagem: linksImagens[2],
                      onTap: () {},
                      tamanhoImagem: 70,
                    ),
                    ImagemPerfilWidget(
                      linkImagem: linksImagens[3],
                      onTap: () {},
                      tamanhoImagem: 70,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    ImagemPerfilWidget(
                      linkImagem: linksImagens[4],
                      onTap: () {},
                      tamanhoImagem: 70,
                    ),
                    ImagemPerfilWidget(
                      linkImagem: linksImagens[5],
                      onTap: () {},
                      tamanhoImagem: 70,
                    ),
                    ImagemPerfilWidget(
                      linkImagem: linksImagens[6],
                      onTap: () {},
                      tamanhoImagem: 70,
                    ),
                    ImagemPerfilWidget(
                      linkImagem: linksImagens[7],
                      onTap: () {},
                      tamanhoImagem: 70,
                    ),
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
        return alert;
      },
    );
  }
}
