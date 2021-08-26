import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorSeguindo.dart';

class DadosPerfilWidget extends StatefulWidget {
  @override
  _DadosPerfilWidgetState createState() => _DadosPerfilWidgetState();
}

class _DadosPerfilWidgetState extends State<DadosPerfilWidget> {
  ControladorSeguindo _controladorSeguindo = GetIt.I.get<ControladorSeguindo>();
  int _numeroFollows = GetIt.I.get<ControladorSeguindo>().numeroFollow;
  int _numeroFollowers = GetIt.I.get<ControladorSeguindo>().numeroFollowers;

  @override
  void initState() {
    _controladorSeguindo.listarSeguidores(sucesso: () {
      setState(() {});
    });
    _controladorSeguindo.listarSeguindo(sucesso: () {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, _numeroFollows.toString(), 'Seguindo'),
          buildDivider(),
          buildButton(context, _numeroFollowers.toString(), 'Seguidores'),
        ],
      );

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
