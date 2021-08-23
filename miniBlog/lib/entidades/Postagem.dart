import 'package:json_annotation/json_annotation.dart';
import 'package:miniBlog/entidades/Usuario.dart';
part 'Postagem.g.dart';

/* Modelo da postagem
[
  {
    "conteudo": "string",
    "data": "dd/MM/yyyy HH:mm:ss",
    "id": "string",
    "usuario": {
      "email": "string",
      "id": "string",
      "imagemPerfil": "string",
      "nome": "string",
      "senha": "string"
    }
  }
] */

@JsonSerializable()
class Postagem {
  String conteudo, id, data;
  Usuario usuario;

  Postagem({this.conteudo, this.id, this.data, this.usuario});

  factory Postagem.fromJson(Map<String, dynamic> json) => _$PostagemFromJson(json);
  Map<String, dynamic> toJson() => _$PostagemToJson(this);
}
