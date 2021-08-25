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
  Future<dynamic> cadastrarComentario(comentario) async {
    ArgumentError.checkNotNull(comentario, 'comentario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(comentario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request(
        'https://app.pactosolucoes.com.br/socialmedia-api/comentarios',
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

  @override
  Future<Comentario> buscarComentario(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = Comentario.fromJson(_result.data);
    return value;
  }

  @override
  Future<String> editarComentario(id, comentarioDto) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(comentarioDto, 'comentarioDto');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(comentarioDto?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<String> deletarComentario(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios/$id',
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
  Future<Postagem> listarPostagens() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Postagem.fromJson(_result.data);
    return value;
  }

  @override
  Future<Postagem> cadastrarPostagem(postagem) async {
    ArgumentError.checkNotNull(postagem, 'postagem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(postagem?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/postagens',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Postagem.fromJson(_result.data);
    return value;
  }

  @override
  Future<Postagem> editarPostagem(postagem) async {
    ArgumentError.checkNotNull(postagem, 'postagem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(postagem?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Postagem.fromJson(_result.data);
    return value;
  }

  @override
  Future<dynamic> excluirPostagem(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        'https://app.pactosolucoes.com.br/socialmedia-api/postagens/$id',
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
  Future<Postagem> buscarPost(idPost) async {
    ArgumentError.checkNotNull(idPost, 'idPost');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/$idPost',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = Postagem.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Postagem>> listarPostagensSeguindo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/postagens/listaPost',
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
  Future<List<Postagem>> listarMinhasPostagens() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/meuUsuario',
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
  Future<List<Postagem>> listarPostagensDeUmUsuario() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/postagens/postagemUsuario',
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
  Future<List<Usuario>> listarSeguindo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/seguindo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Usuario.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<String> seguirUsuario(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/seguindo/$id',
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

  @override
  Future<String> unFollowUser(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/seguindo/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<List<Usuario>> listarMeusSeguidores() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/seguindo/seguidores',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Usuario.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Usuario>> filtrarUsuarios(nome) async {
    ArgumentError.checkNotNull(nome, 'nome');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'nome': nome};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Usuario.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<dynamic> cadastrarUsuario(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request(
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

  @override
  Future<Usuario> buscarUsuario(idUsuario) async {
    ArgumentError.checkNotNull(idUsuario, 'idUsuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/$idUsuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Usuario.fromJson(_result.data);
    return value;
  }

  @override
  Future<dynamic> editarUsuario(idUsuario, usuario) async {
    ArgumentError.checkNotNull(idUsuario, 'idUsuario');
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/$idUsuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> excluirUsuario(idUsuario) async {
    ArgumentError.checkNotNull(idUsuario, 'idUsuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/$idUsuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }
}
