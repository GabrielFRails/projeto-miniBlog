import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({Key key}) : super(key: key);

  @override
  _TelaSplashState createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      _controladorUsuario.usuarioExiste(existe: () {
        Navigator.pushReplacementNamed(context, "/telaPrincipal");
      }, naoExiste: () {
        Navigator.pushReplacementNamed(context, "/telaLogin");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("hello padawan"),
    );
  }
}
