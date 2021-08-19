import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorPost.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
<<<<<<< Updated upstream
import 'package:miniBlog/controladores/ControladorWidget.dart';
import 'package:miniBlog/servicos/ServicoDioProvider.dart';
import 'package:miniBlog/servicos/ServicosDoMiniBlog.dart';
import 'package:miniBlog/telas/TelaCadastro.dart';
import 'package:miniBlog/telas/TelaComentario.dart';
import 'package:miniBlog/telas/TelaEditarPerfil.dart';
import 'package:miniBlog/telas/TelaLogin.dart';
import 'package:miniBlog/telas/TelaPerfil.dart';
import 'package:miniBlog/telas/TelaPrincipal.dart';
import 'package:miniBlog/telas/TelaSplash.dart';

final getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var dioConnect = ServicoDioProvider().getDio();
  getIt.registerSingleton<ControladorUsuario>(ControladorUsuario());
  getIt.registerSingleton<ServicosDoMiniBlog>(ServicosDoMiniBlog(dioConnect));
  getIt.registerSingleton<ControladorPost>(ControladorPost());
  getIt.registerSingleton<ControladorPost>(ControladorPost());
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
            primaryColorBrightness: Brightness.light),
        initialRoute: "/telaLogin",
        routes: {
          "/telaSplash": (_) => TelaSplash(),
          "/telaPrincipal": (_) => TelaPrincipal(),
          "/telaLogin": (_) => TelaLogin(),
          "/telaCadastro": (_) => TelaCadastro(),
          "/telaPerfil": (_) => TelaPerfil(),
          "/telaEditarPerfil": (_) => TelaEditarPerfil(),
          "/telaComentario": (_) => TelaComentario()
        });
  }
}
