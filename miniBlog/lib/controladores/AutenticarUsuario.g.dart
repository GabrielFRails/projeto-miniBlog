// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AutenticarUsuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutenticarUsuario _$AutenticarUsuarioFromJson(Map<String, dynamic> json) {
  return AutenticarUsuario(
    email: json['email'] as String,
    senha: json['senha'] as String,
  );
}

Map<String, dynamic> _$AutenticarUsuarioToJson(AutenticarUsuario instance) =>
    <String, dynamic>{
      'email': instance.email,
      'senha': instance.senha,
    };
