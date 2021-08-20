// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComentarioDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComentarioDto _$ComentarioDtoFromJson(Map<String, dynamic> json) {
  return ComentarioDto(
    conteudo: json['conteudo'] as String,
    idPostagem: json['idPostagem'] as String,
  );
}

Map<String, dynamic> _$ComentarioDtoToJson(ComentarioDto instance) =>
    <String, dynamic>{
      'conteudo': instance.conteudo,
      'idPostagem': instance.idPostagem,
    };
