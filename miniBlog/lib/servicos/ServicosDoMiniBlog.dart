import 'package:miniBlog/controladores/AutenticarUsuario.dart';
import 'package:miniBlog/entidades/Comentario.dart';
import 'package:miniBlog/entidades/Postagem.dart';
import 'package:miniBlog/entidades/Token.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/util/UtilRetorno.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'ServicosDoMiniBlog.g.dart';

@RestApi(baseUrl: "")
abstract class ServicosDoMiniBlog {
  factory ServicosDoMiniBlog(Dio dio, {String baseUrl}) = _ServicosDoMiniBlog;

  //Autenticação

  @POST("https://app.pactosolucoes.com.br/socialmedia-api/authenticate")
  Future<Token> autenticarUsuario(@Body() AutenticarUsuario autenticarUsuario);

  //Parte Serviços dos Comentários

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/comentarios")
  Future<List<Comentario>> listarComentariosPostagem(
      @Query("idPostagem") String idPostagem);

  // @POST("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios")
  // Future<String> cadastrarComentario(@Body() ComentarioDto comentarioDto);

  @GET(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios/{id}")
  @FormUrlEncoded()
  Future<Comentario> buscarComentario(@Path("id") String id);

  @PUT(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios/{id}")
  @FormUrlEncoded()
  Future<String> editarComentario(
      @Path("id") String id, @Body() Comentario comentarioDto);

  @DELETE(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios/{id}")
  @FormUrlEncoded()
  Future<String> deletarComentario(@Path("id") String id);

  // //Parte Serviços das Postagens

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens")
  Future<Postagem> listarPostagens();

  @POST("/postagens")
  Future<Postagem> cadastrarPostagem(@Body() Postagem postagem);

  @PUT("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens")
  Future<Postagem> editarPostagem(@Body() Postagem postagem);

  @DELETE(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/{id}")
  @FormUrlEncoded()
  Future<String> excluirPostagem(@Path("id") String id);

  @POST("https://app.pactosolucoes.com.br/socialmedia-api/postagens/{id}/like")
  @FormUrlEncoded()
  Future<dynamic> darLike(@Path("id") String id);

  @DELETE(
      "https://app.pactosolucoes.com.br/socialmedia-api/postagens/{id}/like")
  @FormUrlEncoded()
  Future<dynamic> removerLike(@Path("id") String id);

  @GET(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/{idPost}")
  @FormUrlEncoded()
  Future<Postagem> buscarPost(@Path("idPost") String idPost);

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/postagens")
  Future<List<Postagem>> listarPostagensSeguindo();

  @GET(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/meuUsuario")
  Future<List<Postagem>> listarMinhasPostagens();

  @GET("/postagens/postagemUsuario")
  Future<List<Postagem>> listarPostagensDeUmUsuario();

  // //Parte Serviços Seguindo

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/seguindo")
  Future<List<Usuario>> listarSeguindo(); //quem eu sigo

  @POST("https://app.pactosolucoes.com.br/socialmedia-api/seguindo/{id}")
  Future<String> seguirUsuario(@Path("id") int id);

  @DELETE("https://app.pactosolucoes.com.br/socialmedia-api/seguindo/{id}")
  //@FormUrlEncoded()
  Future<String> unFollowUser(@Path("id") int id);

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/seguindo/seguidores")
  Future<List<Usuario>> listarMeusSeguidores();

  // //Parte Serviços do Usuário

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/usuarios")
  Future<List<Usuario>> filtrarUsuarios(@Query("nome") String nome);

  @POST("https://app.pactosolucoes.com.br/socialmedia-api/usuarios")
  Future<dynamic> cadastrarUsuario(@Body() Usuario usuario);

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/{idUsuario}")
  @FormUrlEncoded()
  Future<UtilRetornoUsuario> buscarUsuario(@Path("idUsuario") int idUsuario);

  @PUT("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/{idUsuario}")
  Future<dynamic> editarUsuario(
      @Path("idUsuario") int idUsuario, @Body() Usuario usuario);

  @DELETE(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/{idUsuario}")
  Future<dynamic> excluirUsuario(@Path("idUsuario") int idUsuario);
}
