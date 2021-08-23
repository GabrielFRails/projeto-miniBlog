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
  Future<UtilRetornoComentarios> listarComentariosPostagem(idPostagem) async {
    ArgumentError.checkNotNull(idPostagem, 'idPostagem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = idPostagem;
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/comentarios',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoComentarios.fromJson(_result.data);
    return value;
  }

  @override
  Future<String> cadastrarComentario(comentarioDto) async {
    ArgumentError.checkNotNull(comentarioDto, 'comentarioDto');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(comentarioDto?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios',
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
  Future<UtilRetornoPost> listarPostagens() async {
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
    final value = UtilRetornoPost.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoPost> cadastrarPostagem(postagem) async {
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
    final value = UtilRetornoPost.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoPostagem> editarPostagem(postagem) async {
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
    final value = UtilRetornoPostagem.fromJson(_result.data);
    return value;
  }

  @override
  Future<String> excluirPostagem(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/$id',
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
  Future<String> darLike(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/$id/like',
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
  Future<String> removerLike(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>('/postagens/$id/like',
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
  Future<UtilRetornoPost> buscarPost(idPost) async {
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
    final value = UtilRetornoPost.fromJson(_result.data);
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
  Future<UtilRetornoPostagens> listarMinhasPostagens() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/meuUsuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoPostagens.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoPostagens> listarPostagensDeUmUsuario() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/postagens/postagemUsuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoPostagens.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoUsers> listarSeguidores() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/seguindo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsers.fromJson(_result.data);
    return value;
  }

  @override
  Future<String> seguirUsuario(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/seguindo/$id',
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
  Future<String> unFollowUser(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/seguindo/$id',
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
  Future<UtilRetornoUsers> listarMeusSeguidores() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/seguindo​/seguidores',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsers.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoUsuario> filtrarUsuarios(nome) async {
    ArgumentError.checkNotNull(nome, 'nome');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'nome': nome};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'https://app.pactosolucoes.com.br/socialmedia-api/usuarios/usuarios',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsuario.fromJson(_result.data);
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
  Future<UtilRetornoUsuario> buscarUsuario(idUsuario) async {
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
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsuario.fromJson(_result.data);
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
