// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UtilRetorno.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UtilRetornoUsuario _$UtilRetornoUsuarioFromJson(Map<String, dynamic> json) {
  return UtilRetornoUsuario(
    sucesso: json['sucesso'] == null
        ? null
        : Usuario.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilRetornoUsuarioToJson(UtilRetornoUsuario instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoPost _$UtilRetornoPostFromJson(Map<String, dynamic> json) {
  return UtilRetornoPost(
    sucesso: json['sucesso'] == null
        ? null
        : Post.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilRetornoPostToJson(UtilRetornoPost instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoPostagem _$UtilRetornoPostagemFromJson(Map<String, dynamic> json) {
  return UtilRetornoPostagem(
    sucesso: json['sucesso'] == null
        ? null
        : Postagem.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilRetornoPostagemToJson(
        UtilRetornoPostagem instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoPostagens _$UtilRetornoPostagensFromJson(Map<String, dynamic> json) {
  return UtilRetornoPostagens(
    sucesso: (json['sucesso'] as List)
        ?.map(
            (e) => e == null ? null : Post.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UtilRetornoPostagensToJson(
        UtilRetornoPostagens instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoUsers _$UtilRetornoUsersFromJson(Map<String, dynamic> json) {
  return UtilRetornoUsers(
    sucesso: (json['sucesso'] as List)
        ?.map((e) =>
            e == null ? null : Usuario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UtilRetornoUsersToJson(UtilRetornoUsers instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoComentario _$UtilRetornoComentarioFromJson(
    Map<String, dynamic> json) {
  return UtilRetornoComentario(
    sucesso: json['sucesso'] == null
        ? null
        : Comentario.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilRetornoComentarioToJson(
        UtilRetornoComentario instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoComentarios _$UtilRetornoComentariosFromJson(
    Map<String, dynamic> json) {
  return UtilRetornoComentarios(
    sucesso: (json['sucesso'] as List)
        ?.map((e) =>
            e == null ? null : Comentario.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UtilRetornoComentariosToJson(
        UtilRetornoComentarios instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };
