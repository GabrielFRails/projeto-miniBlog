// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServicosDoMiniBlog.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ServicosDoMiniBlog implements ServicosDoMiniBlog {
  _ServicosDoMiniBlog(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Token> autenticarUsuario(autenticarUsuario) async {
    ArgumentError.checkNotNull(autenticarUsuario, 'autenticarUsuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(autenticarUsuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/authenticate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Token.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Comentario>> listarComentariosPostagem(idPostagem) async {
    ArgumentError.checkNotNull(idPostagem, 'idPostagem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'idPostagem': idPostagem};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/comentarios',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Comentario.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<dynamic> darLike(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        'https://app.pactosolucoes.com.br/socialmedia-api/postagens/$id/like',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> removerLike(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        'https://app.pactosolucoes.com.br/socialmedia-api/postagens/$id/like',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<List<Postagem>> listarPostagensSeguindo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/postagens',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Postagem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<String> cadastrarUsuario(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }
}
