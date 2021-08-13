import 'package:flutter/material.dart';
import 'package:miniBlog/telas/TelaFeed.dart';
import 'package:miniBlog/telas/TelaPerfil.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _currentIndex = 0;
  List<Widget> screens = [
    TelaFeed(),
    TelaPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          fixedColor: Color.fromRGBO(143, 148, 251, .9),
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
