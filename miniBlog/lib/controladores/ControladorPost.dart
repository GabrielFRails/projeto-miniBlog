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
  ObservableList<Comentario> comentarios = new ObservableList<Comentario>();

  @observable
  ObservableList<Postagem> postsSeguidos = new ObservableList<Postagem>();

  @observable
  StatusConsulta statusConsultaFeed = StatusConsulta.CARREGANDO;

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
}
