import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/telas/TelaFeed.dart';
import 'package:miniBlog/telas/TelaPerfil.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _currentIndex = 0;
  final _controlerUsuario = GetIt.I.get<ControladorUsuario>();
  List<Widget> screens = [
    TelaFeed(),
    TelaPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
    print(_controlerUsuario.mUsuarioLogado);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Twitter da Pacto",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff276B69),
        actions: <Widget>[
          _currentIndex == 1
              ? IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/telaLogin");
                  })
              : IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0xff008A85),
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: 'Feed',
                icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: 'Profile',
                icon: Icon(Icons.person_outline_rounded)),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: screens[_currentIndex],
      ),
    );
  }
}
