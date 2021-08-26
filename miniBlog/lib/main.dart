import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorPost.dart';
import 'package:miniBlog/controladores/ControladorSeguindo.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/controladores/ControladorWidget.dart';
import 'package:miniBlog/servicos/ServicoDioProvider.dart';
import 'package:miniBlog/servicos/ServicosDoMiniBlog.dart';
import 'package:miniBlog/telas/TelaCadastro.dart';
import 'package:miniBlog/telas/TelaComentario.dart';
import 'package:miniBlog/telas/TelaEditarPerfil.dart';
import 'package:miniBlog/telas/TelaEditarPost.dart';
import 'package:miniBlog/telas/TelaLogin.dart';
import 'package:miniBlog/telas/TelaPerfil.dart';
import 'package:miniBlog/telas/TelaPostar.dart';
import 'package:miniBlog/telas/TelaPrincipal.dart';
import 'package:miniBlog/telas/TelaSplash.dart';
import 'package:miniBlog/theme/ThemeChanger.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var dioConnect = ServicoDioProvider().getDio();
  getIt.registerSingleton<ServicosDoMiniBlog>(ServicosDoMiniBlog(dioConnect));
  getIt.registerSingleton<ControladorUsuario>(ControladorUsuario());
  getIt.registerSingleton<ControladorPost>(ControladorPost());
  getIt.registerSingleton<ControladorWidget>(ControladorWidget());
  getIt.registerSingleton<ControladorSeguindo>(ControladorSeguindo());
  getIt.registerSingleton(ThemeChanger(ThemeData.light()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatefulWidget {
  const MaterialAppWithTheme({Key key}) : super(key: key);

  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  ThemeChanger theme = GetIt.I.get<ThemeChanger>();

  @override
  Widget build(BuildContext context) {
    ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
    _controladorUsuario.context = context;
    return Observer(builder: (_) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: _controladorUsuario.themeMode == ThemeMode.dark
              ? ThemeData.dark()
              : ThemeData.light(),
          initialRoute: "/telaLogin",
          routes: {
            "/telaSplash": (_) => TelaSplash(),
            "/telaPrincipal": (_) => TelaPrincipal(),
            "/telaLogin": (_) => TelaLogin(),
            "/telaCadastro": (_) => TelaCadastro(),
            "/telaPerfil": (_) => TelaPerfil(),
            "/telaEditarPerfil": (_) => TelaEditarPerfil(),
            "/telaComentario": (_) => TelaComentario(),
            "/telaPostar": (_) => TelaPostar(),
            "/telaEditarPost": (_) => TelaEditarPost()
          });
    });
  }
}
