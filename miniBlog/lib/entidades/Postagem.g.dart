// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Postagem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Postagem _$PostagemFromJson(Map<String, dynamic> json) {
  return Postagem(
    conteudo: json['conteudo'] as String,
    id: json['id'] as String,
    data: json['data'] as String,
    usuario: json['usuario'] == null
        ? null
        : Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
  )
    ..temLike = json['temLike'] as bool
    ..qntdComentario = json['qntdComentario'] as int
    ..qntdLike = json['qntdLike'] as int
    ..comentarios = (json['comentarios'] as List)
        ?.map((e) =>
            e == null ? null : Comentario.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PostagemToJson(Postagem instance) => <String, dynamic>{
      'conteudo': instance.conteudo,
      'id': instance.id,
      'data': instance.data,
      'usuario': instance.usuario,
      'temLike': instance.temLike,
      'qntdComentario': instance.qntdComentario,
      'qntdLike': instance.qntdLike,
      'comentarios': instance.comentarios,
    };
