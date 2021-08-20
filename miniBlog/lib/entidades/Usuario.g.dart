// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    nome: json['nome'] as String,
    senha: json['senha'] as String,
    id: json['id'] as String,
    email: json['email'] as String,
    imagemPerfil: json['imagemPerfil'] as String,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'nome': instance.nome,
      'id': instance.id,
      'senha': instance.senha,
      'email': instance.email,
      'imagemPerfil': instance.imagemPerfil,
    };
