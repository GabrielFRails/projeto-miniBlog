// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Comentario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comentario _$ComentarioFromJson(Map<String, dynamic> json) {
  return Comentario(
    conteudo: json['conteudo'] as String,
    data: UtilDataHora.convert(json['data']),
    usuario: json['usuario'] == null
        ? null
        : Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
    idComentario: json['idComentario'] as String,
    idPostagem: json['idPostagem'] as String,
  );
}

Map<String, dynamic> _$ComentarioToJson(Comentario instance) =>
    <String, dynamic>{
      'conteudo': instance.conteudo,
      'idComentario': instance.idComentario,
      'idPostagem': instance.idPostagem,
      'data': instance.data?.toIso8601String(),
      'usuario': instance.usuario,
    };
