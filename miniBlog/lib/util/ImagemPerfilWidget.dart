import 'package:flutter/material.dart';

class ImagemPerfilWidget extends StatelessWidget {
  final String linkImagem;
  final double tamanhoImagem;
  final Function() onTap;
  const ImagemPerfilWidget(
      {Key key, this.linkImagem, this.tamanhoImagem, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [buildImage()],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(linkImagem);
    return ClipOval(
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Ink.image(
              image: image,
              fit: BoxFit.cover,
              width: tamanhoImagem,
              height: tamanhoImagem,
            ),
          )),
    );
  }
}
