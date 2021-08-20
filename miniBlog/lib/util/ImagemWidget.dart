import 'package:flutter/material.dart';

class ImagemWidget extends StatelessWidget {
  final String linkImagem;
  final double tamanhoImagem;
  final Function() onTap;
  final bool isSelecionado;
  const ImagemWidget(
      {Key key,
      this.linkImagem,
      this.tamanhoImagem,
      this.onTap,
      this.isSelecionado})
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
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              this.isSelecionado
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 4),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color: Colors.amberAccent,
                        ),
                      ),
                    )
                  : Container(),
              InkWell(
                onTap: onTap,
                child: Ink.image(
                  image: image,
                  fit: BoxFit.cover,
                  width: tamanhoImagem,
                  height: tamanhoImagem,
                ),
              ),
            ],
          )),
    );
  }
}
