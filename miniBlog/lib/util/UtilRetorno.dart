import 'package:json_annotation/json_annotation.dart';
import 'package:miniBlog/entidades/Comentario.dart';
import 'package:miniBlog/entidades/Postagem.dart';
import 'package:miniBlog/entidades/Usuario.dart';

part 'UtilRetorno.g.dart';

@JsonSerializable()
class UtilRetornoUsuario {
  Usuario sucesso;
  UtilRetornoUsuario({this.sucesso});

  factory UtilRetornoUsuario.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoUsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoUsuarioToJson(this);
}

@JsonSerializable()
class UtilRetornoPost {
  Postagem sucesso;
  UtilRetornoPost({this.sucesso});

  factory UtilRetornoPost.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoPostFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoPostToJson(this);
}

@JsonSerializable()
class UtilRetornoPostagem {
  Postagem sucesso;
  UtilRetornoPostagem({this.sucesso});

  factory UtilRetornoPostagem.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoPostagemFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoPostagemToJson(this);
}

@JsonSerializable()
class UtilRetornoPostagens {
  List<Postagem> sucesso;
  UtilRetornoPostagens({this.sucesso});

  factory UtilRetornoPostagens.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoPostagensFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoPostagensToJson(this);
}

@JsonSerializable()
class UtilRetornoUsers {
  List<Usuario> sucesso;
  UtilRetornoUsers({this.sucesso});

  factory UtilRetornoUsers.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoUsersFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoUsersToJson(this);
}

@JsonSerializable()
class UtilRetornoComentario {
  Comentario sucesso;
  UtilRetornoComentario({this.sucesso});

  factory UtilRetornoComentario.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoComentarioFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoComentarioToJson(this);
}

@JsonSerializable()
class UtilRetornoComentarios {
  List<Comentario> sucesso;
  UtilRetornoComentarios({this.sucesso});

  factory UtilRetornoComentarios.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoComentariosFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoComentariosToJson(this);
}
