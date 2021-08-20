import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorPost.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/enums/StatusConsulta.dart';
import 'package:miniBlog/util/UtilDialogo.dart';
import 'package:miniBlog/widgets_padrao/PostagemWidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TelaFeed extends StatefulWidget {
  const TelaFeed({Key key}) : super(key: key);

  @override
  _TelaFeedState createState() => _TelaFeedState();
}

class _TelaFeedState extends State<TelaFeed> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  ControladorPost _controladorPost = GetIt.I.get<ControladorPost>();

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    _controladorPost.consultarOFeed(
        sucesso: () {}, erro: (text) {}, carregando: () {});
    super.initState();
  }

  _consultarOFeed() {
    _controladorPost.consultarOFeed(sucesso: () {
      Navigator.pop(context);
      _refreshController.refreshCompleted();
    }, erro: (mensagem) {
      Navigator.pop(context);
      _refreshController.refreshFailed();
    }, carregando: () {
      UtilDialogo.showLoading(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
          onRefresh: _consultarOFeed,
          controller: _refreshController,
          header: MaterialClassicHeader(
            color: Colors.teal[200],
          ),
          child: listaDePosts()),
    );
  }

  Widget listaDePosts() {
    return Container(
      color: Colors.white,
      child: Observer(builder: (_) {
        switch (_controladorPost.statusConsultaFeed) {
          case StatusConsulta.CARREGANDO:
            return Text("Carregando...");
            break;
          case StatusConsulta.ERRO:
            return Text("Deu pau");
            break;
          case StatusConsulta.SUCESSO:
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var postSeguido = _controladorUsuario.postsSeguidos[index];
                return Column(
                  children: [
                    PostagemWidget(
                        context: context,
                        avatar: "https://picsum.photos/id/237/200/300",
                        username: "matheus",
                        timeAgo: "2",
                        text: "${postSeguido.conteudo}",
                        comments: "3",
                        favorites: "4"),
                    Divider(
                      thickness: 1,
                      height: 1,
                    )
                  ],
                );
              },
              itemCount: _controladorUsuario.postsSeguidos.length,
            );
        }
      }),
    );
  }
}
