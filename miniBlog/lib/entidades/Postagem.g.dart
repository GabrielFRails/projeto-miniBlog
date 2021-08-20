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
    criador: json['criador'] == null
        ? null
        : Usuario.fromJson(json['criador'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostagemToJson(Postagem instance) => <String, dynamic>{
      'conteudo': instance.conteudo,
      'id': instance.id,
      'data': instance.data,
      'criador': instance.criador,
    };
