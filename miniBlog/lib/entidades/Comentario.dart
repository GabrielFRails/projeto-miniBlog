import 'package:json_annotation/json_annotation.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/util/UtilDataHora.dart';
part 'Comentario.g.dart';

@JsonSerializable()
class Comentario {
  String conteudo, idComentario, idPostagem;
  @JsonKey(fromJson: UtilDataHora.convert)
  DateTime data;
  Usuario usuario;

  Comentario(
      {this.conteudo,
      this.data,
      this.usuario,
      this.idComentario,
      this.idPostagem});

  factory Comentario.fromJson(Map<String, dynamic> json) =>
      _$ComentarioFromJson(json);
  Map<String, dynamic> toJson() => _$ComentarioToJson(this);
}
