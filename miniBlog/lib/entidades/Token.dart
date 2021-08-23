import 'package:json_annotation/json_annotation.dart';

import 'Usuario.dart';

part 'Token.g.dart';

@JsonSerializable()
class Token {
  String token;
  @JsonKey(name: 'usuario')
  Usuario autenticado;
  Token({this.token, this.autenticado});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
