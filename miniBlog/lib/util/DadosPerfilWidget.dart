import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorSeguindo.dart';

class DadosPerfilWidget extends StatefulWidget {
  final int numFollow;
  final int numFollowers;

  DadosPerfilWidget({@required this.numFollow, @required this.numFollowers});

  @override
  _DadosPerfilWidgetState createState() => _DadosPerfilWidgetState();
}

class _DadosPerfilWidgetState extends State<DadosPerfilWidget> {
  bool carregando = false;

  @override
  /* void initState() {
    _controladorSeguindo.listarSeguidores(carregando: () {
      carregando = true;
    }, sucesso: () {
      _controladorSeguindo.listarSeguindo(carregando: () {
        carregando = true;
      }, sucesso: () {
        carregando = false;
        setState(() {});
      });
    });

    super.initState();
  } */

  @override
  Widget build(BuildContext context) => carregando
      ? Center(
          child: CircularProgressIndicator(),
        )
      : Observer(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton(context, widget.numFollow.toString(), 'Seguindo'),
              buildDivider(),
              buildButton(
                  context, widget.numFollowers.toString(), 'Seguidores'),
            ],
          );
        });

  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
