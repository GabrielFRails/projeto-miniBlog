import 'package:get_it/get_it.dart';
import 'package:miniBlog/entidades/Comentario.dart';
import 'package:miniBlog/entidades/Postagem.dart';
import 'package:miniBlog/enums/StatusConsulta.dart';
import 'package:miniBlog/servicos/ServicosDoMiniBlog.dart';
import 'package:mobx/mobx.dart';
part 'ControladorPost.g.dart';

class ControladorPost = _ControladorPostBase with _$ControladorPost;

abstract class _ControladorPostBase with Store {
  ServicosDoMiniBlog service = GetIt.I.get<ServicosDoMiniBlog>();

  @observable
  ObservableList<Postagem> postsSeguidos = new ObservableList<Postagem>();

  @observable
  String postId = "";

  @observable
  ObservableList<Comentario> comentariosPost = new ObservableList<Comentario>();

  @observable
  StatusConsulta statusConsultaFeed = StatusConsulta.CARREGANDO;

  @observable
  StatusConsulta statusConsultaComentario = StatusConsulta.CARREGANDO;

  @observable
  int numeroComentarios = 0;

  @observable
  bool liked = false;

  void consultarOFeed(
      {Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    carregando?.call();
    statusConsultaFeed = StatusConsulta.CARREGANDO;
    service.listarPostagensSeguindo().then((responsePosts) {
      postsSeguidos.clear();
      postsSeguidos.addAll(responsePosts);
      statusConsultaFeed = StatusConsulta.SUCESSO;
      sucesso?.call();
    }).catchError((onError) {
      statusConsultaFeed = StatusConsulta.ERRO;
      erro?.call("Houve um erro");
    });
  }

  void consultarComentarios(String idPostagem,
      {Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    carregando?.call();
    statusConsultaComentario = StatusConsulta.CARREGANDO;
    service.listarComentariosPostagem(idPostagem).then((responseComentarios) {
      comentariosPost.clear();
      comentariosPost.addAll(responseComentarios);
      statusConsultaComentario = StatusConsulta.SUCESSO;
      sucesso?.call();
    }).catchError((onError) {
      statusConsultaComentario = StatusConsulta.ERRO;
      erro?.call("Houve um erro");
    });
  }

  int getNumeroComentarios(String idPostagem) {
    service.listarComentariosPostagem(idPostagem).then((responseComentarios) {
      comentariosPost.clear();
      comentariosPost.addAll(responseComentarios);
      numeroComentarios = comentariosPost.length;
      return numeroComentarios;
    });
    return 0;
  }

  @action
  void darLike(String id, {Function() erro, Function() sucesso}) {
    service.darLike(id).then((_) {
      var indexPost = postsSeguidos.indexWhere((element) => element.id == id);
      postsSeguidos[indexPost].liked = true;
      sucesso?.call();
    }).catchError((onError) {
      erro?.call();
    });
  }

  @action
  void removerLike(String id, {Function() erro, Function() sucesso}) {
    service.removerLike(id).then((_) {
      var indexPost = postsSeguidos.indexWhere((element) => element.id == id);
      postsSeguidos[indexPost].liked = false;
      sucesso?.call();
    }).catchError((onError) {
      erro?.call();
    });
  }
}
