import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/telas/TelaCadastro.dart';
import 'package:miniBlog/telas/TelaEditarPerfil.dart';
import 'package:miniBlog/telas/TelaLogin.dart';
import 'package:miniBlog/telas/TelaPerfil.dart';
import 'package:miniBlog/telas/TelaPrincipal.dart';
import 'package:miniBlog/telas/TelaSplash.dart';

final getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(ControladorUsuario());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColorBrightness: Brightness.light
        ),
        initialRoute: "/telaPrincipal",
        routes: {
          "/telaSplash": (_) => TelaSplash(),
          "/telaPrincipal": (_) => TelaPrincipal(),
          "/telaLogin": (_) => TelaLogin(),
          "/telaCadastro": (_) => TelaCadastro(),
          "/telaPerfil": (_) => TelaPerfil(),
          "/telaEditarPerfil": (_) => TelaEditarPerfil()
        });
  }
}
