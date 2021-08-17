import 'package:miniBlog/entidades/Comentario.dart';
import 'package:mobx/mobx.dart';
part 'ControladorPost.g.dart';

class ControladorPost = _ControladorPostBase with _$ControladorPost;

abstract class _ControladorPostBase with Store {
  
  @observable
  ObservableList<Comentario> comentarios = new ObservableList<Comentario>();

  
}