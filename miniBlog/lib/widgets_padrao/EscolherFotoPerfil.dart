import 'package:flutter/material.dart';
import 'package:miniBlog/util/ImagemWidget.dart';

import 'BotaoPadrao.dart';

class EscolherFotoPerfil extends StatefulWidget {
  EscolherFotoPerfil({Key key}) : super(key: key);

  @override
  _EscolherFotoPerfilState createState() => _EscolherFotoPerfilState();
}

class _EscolherFotoPerfilState extends State<EscolherFotoPerfil> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Color.fromRGBO(81, 85, 90, 1),
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 250),
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
                Center(child: Text('Define Emoção')),
              ],
            ),
          ),
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    ImagemWidget(
                      //tristesa

                      linkImagem:
                          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/a791ce27407093.5652d8abb06d2.jpg",
                      onTap: () {},
                      tamanhoImagem: 50,
                    ),
                    ImagemWidget(
                      //raiva

                      linkImagem:
                          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/e48ca827407093.5652d8abb1f0d.jpg",
                      onTap: () {},
                      tamanhoImagem: 50,
                    ),
                    ImagemWidget(
                      //alegria

                      linkImagem:
                          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b0ceaf27407093.5652d8abaf325.jpg",
                      onTap: () {},
                      tamanhoImagem: 50,
                    ),
                    ImagemWidget(
                      //nojo

                      linkImagem:
                          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/d80b6327407093.5652d8abb335f.jpg",
                      onTap: () {},
                      tamanhoImagem: 50,
                    ),
                    ImagemWidget(
                      //medo

                      linkImagem:
                          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2268d427407093.5652d8abb440f.jpg",
                      onTap: () {},
                      tamanhoImagem: 50,
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
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
          actions: [],
        ));
  }
}
