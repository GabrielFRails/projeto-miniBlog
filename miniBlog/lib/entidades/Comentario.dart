import 'package:json_annotation/json_annotation.dart';
import 'package:miniBlog/entidades/Usuario.dart';
part 'Comentario.g.dart';

@JsonSerializable()
class Comentario {
  String conteudo;
  Usuario criador;


  Comentario({this.conteudo, this.criador});

  factory Comentario.fromJson(Map<String, dynamic> json) =>
      _$ComentarioFromJson(json);
  Map<String, dynamic> toJson() => _$ComentarioToJson(this);
}
