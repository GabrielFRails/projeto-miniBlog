import 'package:json_annotation/json_annotation.dart';

part 'AutenticarUsuario.g.dart';

@JsonSerializable()
class AutenticarUsuario {

  factory AutenticarUsuario.fromJson(Map<String, dynamic> json) => _$AutenticarUsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$AutenticarUsuarioToJson(this);
  AutenticarUsuario clone() => _$AutenticarUsuarioFromJson(this.toJson());

  AutenticarUsuario({
    this.email,
    this.senha,
  });

  String email;
  String senha;
}
