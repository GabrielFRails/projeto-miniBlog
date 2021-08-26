import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/telas/TelaFeed.dart';
import 'package:miniBlog/telas/TelaPerfil.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/util/UtilStyle.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
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
          style: UtilStyle.text(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: UtilStyle.postContainer(),
        actions: <Widget>[
          _currentIndex == 1
              ? IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: UtilStyle.iconColor(),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/telaLogin");
                  })
              : IconButton(
                  icon: Icon(
                    Icons.search,
                    color: UtilStyle.iconColor(),
                  ),
                  onPressed: () {
                    _controladorUsuario.filtrarUsuarios("");
                    showSearch(context: context, delegate: UsuariosSearch());
                  }),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: UtilStyle.postContainer(),
          boxShadow: [
            BoxShadow(
              color: UtilStyle.shadowColor(),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: UtilStyle.postContainer(),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0xff248FE0),
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: 'Feed',
                icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: 'Perfil',
                icon: Icon(Icons.person_outline_rounded)),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: screens[_currentIndex],
      ),
    );
  }
}

class UsuariosSearch extends SearchDelegate<String> {
  int idAuxiliar;
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  Usuario _usuarioRetorno = GetIt.I.get<ControladorUsuario>().mUsuarioRetorno;
  List<Usuario> _usuariosRetorno =
      GetIt.I.get<ControladorUsuario>().usuariosBuscados;
  List<Usuario> usuariosRecentes = [
    Usuario(
        nome: "Ademiro",
        imagemPerfil:
            "https://www.imagenspng.com.br/wp-content/uploads/2020/10/among-us-white-png-01.png",
        id: "49"),
    Usuario(
        nome: "Gabriel Freitas",
        imagemPerfil:
            "https://i.pinimg.com/564x/a4/8e/55/a48e550b33dbda21217e8141a96db06e.jpg",
        id: "48"),
    Usuario(
        nome: "Teste",
        imagemPerfil:
            "https://i.pinimg.com/564x/a4/8e/55/a48e550b33dbda21217e8141a96db06e.jpg",
        id: "47")
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
          ),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    /*  _controladorUsuario.buscaUsuario(idAuxiliar, sucesso: () {},
        erro: (mensagem) {
      UtilDialogo.exibirAlerta(context,
          titulo: "Ops! Erro ao exibir o perfil", mensagem: mensagem);
    }); */
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: UtilStyle.iconColor(),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("${_usuarioRetorno.nome}"),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ImagemPerfilWidget(
                //   linkImagem: _usuarioRetorno.imagemPerfil,
                //   tamanhoImagem: 30,
                // )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugestaoDeUsuarios = query.isEmpty
        ? usuariosRecentes
        : _usuariosRetorno
            .where((element) => element.nome.startsWith(query))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          idAuxiliar = int.parse(sugestaoDeUsuarios[index].id);
          _controladorUsuario.buscaUsuario(idAuxiliar, sucesso: () {
            showResults(context);
          }, erro: (mensagem) {
            UtilDialogo.exibirAlerta(context,
                titulo: "Ops! Erro", mensagem: mensagem);
          });
        },
        leading: Icon(Icons.person),
        title: RichText(
          text: TextSpan(
              text: sugestaoDeUsuarios[index].nome.substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: sugestaoDeUsuarios[index].nome.substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
              ]),
        ),
      ),
      itemCount: sugestaoDeUsuarios.length,
    );
  }
}
