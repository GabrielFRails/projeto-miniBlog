// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token(
    token: json['token'] as String,
    autenticado: json['usuario'] == null
        ? null
        : Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token': instance.token,
      'usuario': instance.autenticado,
    };
