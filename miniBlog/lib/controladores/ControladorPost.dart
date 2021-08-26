import 'package:get_it/get_it.dart';
import 'package:miniBlog/controladores/ControladorUsuario.dart';
import 'package:miniBlog/entidades/Comentario.dart';
import 'package:miniBlog/entidades/Postagem.dart';
import 'package:miniBlog/enums/StatusConsulta.dart';
import 'package:miniBlog/servicos/ServicosDoMiniBlog.dart';
import 'package:mobx/mobx.dart';
part 'ControladorPost.g.dart';

class ControladorPost = _ControladorPostBase with _$ControladorPost;

abstract class _ControladorPostBase with Store {
  ServicosDoMiniBlog service = GetIt.I.get<ServicosDoMiniBlog>();
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();

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
  Postagem postEditar = new Postagem();

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

  void darLike(String id, {Function() erro, Function() sucesso}) {
    service.darLike(id).then((_) {
      var indexPost = postsSeguidos.indexWhere((element) => element.id == id);
      postsSeguidos[indexPost].temLike = true;
      sucesso?.call();
    }).catchError((onError) {
      erro?.call();
    });
  }

  void removerLike(String id, {Function() erro, Function() sucesso}) {
    service.removerLike(id).then((_) {
      var indexPost = postsSeguidos.indexWhere((element) => element.id == id);
      postsSeguidos[indexPost].temLike = false;
      sucesso?.call();
    }).catchError((onError) {
      erro?.call();
    });
  }

  void cadastrarComentario(Comentario comentario,
      {Function(String msg) erro, Function() sucesso}) {
    service.cadastrarComentario(comentario).then((_) {
      comentariosPost.add(
          comentario.clone()..usuario = _controladorUsuario.mUsuarioLogado);
      sucesso?.call();
    }).catchError((onError) {
      erro?.call("Erro ao adicionar comentário");
    });
  }

  void excluirPostagem(String id,
      {Function(String msg) erro, Function() sucesso}) {
    service.excluirPostagem(id).then((_) {
      sucesso?.call();
    }).catchError((onError) {
      erro?.call("Erro ao excluir postagem");
    });
  }

  void cadastrarPostagem(Postagem postagem,
      {Function(String msg) erro, Function() sucesso, Function() carregando}) {
    carregando?.call();
    service.cadastrarPostagem(postagem).then((_) {
      sucesso?.call();
    }).catchError((onError) {
      erro?.call("Falha ao publicar post");
    });
  }

  void excluirComentario(String id,
      {Function(String msg) erro, Function() sucesso}) {
    service.excluirComentario(id).then((_) {
      comentariosPost
          .removeWhere((comentario) => comentario.idComentario == id);
      sucesso?.call();
    }).catchError((onError) {
      erro("Erro ao excluir comentário")?.call();
    });
  }

  void editarPostagem(Postagem postagem, String id,
      {Function(String msg) erro, Function() sucesso, Function() carregando}) {
    carregando?.call();
    service.editarPostagem(postagem, id).then((_) {
      sucesso?.call();
    }).catchError((onError) {
      erro?.call("Erro ao editar postagem");
    });
  }
}
