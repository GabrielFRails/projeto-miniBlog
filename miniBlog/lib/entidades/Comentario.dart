import 'package:json_annotation/json_annotation.dart';
import 'package:miniBlog/entidades/Usuario.dart';
part 'Comentario.g.dart';

@JsonSerializable()
class Comentario {
  String conteudo, idComentario, idPostagem, data;
  Usuario criador;

  Comentario(
      {this.conteudo,
      this.data,
      this.criador,
      this.idComentario,
      this.idPostagem});

  factory Comentario.fromJson(Map<String, dynamic> json) =>
      _$ComentarioFromJson(json);
  Map<String, dynamic> toJson() => _$ComentarioToJson(this);
}
