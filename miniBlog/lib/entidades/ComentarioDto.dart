import 'package:json_annotation/json_annotation.dart';
part 'ComentarioDto.g.dart';

@JsonSerializable()
class ComentarioDto {
  String conteudo, idPostagem;

  ComentarioDto({this.conteudo, this.idPostagem});

  factory ComentarioDto.fromJson(Map<String, dynamic> json) =>
      _$ComentarioDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ComentarioDtoToJson(this);
}
