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
  )..liked = json['liked'] as bool;
}

Map<String, dynamic> _$PostagemToJson(Postagem instance) => <String, dynamic>{
      'conteudo': instance.conteudo,
      'id': instance.id,
      'data': instance.data,
      'usuario': instance.usuario,
      'liked': instance.liked,
    };
