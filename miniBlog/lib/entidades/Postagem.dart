import 'package:json_annotation/json_annotation.dart';
part 'Postagem.g.dart';

/* Modelo da postagem
{
conteudo*	string
} */

@JsonSerializable()
class Postagem {
  String conteudo;

  Postagem({this.conteudo});

  factory Postagem.fromJson(Map<String, dynamic> json) =>
      _$PostagemFromJson(json);
  Map<String, dynamic> toJson() => _$PostagemToJson(this);
}
