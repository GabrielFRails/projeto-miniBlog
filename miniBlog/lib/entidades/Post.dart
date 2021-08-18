import 'package:json_annotation/json_annotation.dart';

import 'Usuario.dart';
part 'Post.g.dart';

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
class Post {
  String conteudo, id, data;
  Usuario criador;

  Post({this.conteudo, this.id, this.data, this.criador});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
