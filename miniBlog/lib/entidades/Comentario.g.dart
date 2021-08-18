// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Comentario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comentario _$ComentarioFromJson(Map<String, dynamic> json) {
  return Comentario(
    conteudo: json['conteudo'] as String,
    data: json['data'] as String,
    criador: json['criador'] == null
        ? null
        : Usuario.fromJson(json['criador'] as Map<String, dynamic>),
    idComentario: json['idComentario'] as String,
    idPostagem: json['idPostagem'] as String,
  );
}

Map<String, dynamic> _$ComentarioToJson(Comentario instance) =>
    <String, dynamic>{
      'conteudo': instance.conteudo,
      'idComentario': instance.idComentario,
      'idPostagem': instance.idPostagem,
      'data': instance.data,
      'criador': instance.criador,
    };
