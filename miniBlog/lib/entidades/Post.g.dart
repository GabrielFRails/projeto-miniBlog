// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    conteudo: json['conteudo'] as String,
    id: json['id'] as String,
    data: json['data'] as String,
    criador: json['criador'] == null
        ? null
        : Usuario.fromJson(json['criador'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'conteudo': instance.conteudo,
      'id': instance.id,
      'data': instance.data,
      'criador': instance.criador,
    };
