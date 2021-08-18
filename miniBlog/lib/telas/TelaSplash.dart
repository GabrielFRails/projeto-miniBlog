import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({Key key}) : super(key: key);

  @override
  _TelaSplashState createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      animationDuration: Duration(seconds: 3),
      splash: Icons.coronavirus_sharp,
      screenFunction: () async {
        GetIt.I.get<ControladorUsuario>().usuarioExiste(existe: () {
          Navigator.pushReplacementNamed(context, "/telaPrincipal");
        }, naoExiste: () {
          Navigator.pushReplacementNamed(context, "/telaLogin");
        });
        return;
      },
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
