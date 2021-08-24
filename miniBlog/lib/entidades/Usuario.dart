import 'package:json_annotation/json_annotation.dart';
part 'Usuario.g.dart';

@JsonSerializable()
class Usuario {
  String nome, id, senha, email, imagemPerfil;

  Usuario clone() {
    return _$UsuarioFromJson(this.toJson());
  }

  Usuario({this.nome, this.senha, this.id, this.email, this.imagemPerfil});

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
