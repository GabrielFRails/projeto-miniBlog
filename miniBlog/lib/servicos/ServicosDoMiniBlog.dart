import 'package:miniBlog/controladores/AutenticarUsuario.dart';
import 'package:miniBlog/entidades/Comentario.dart';
import 'package:miniBlog/entidades/ComentarioDto.dart';
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
  Future<UtilRetornoComentarios> listarComentariosPostagem(
      @Body() String idPostagem);

  @POST("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios")
  Future<String> cadastrarComentario(@Body() ComentarioDto comentarioDto);

  @GET(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios/{id}")
  @FormUrlEncoded()
  Future<Comentario> buscarComentario(@Path("id") String id);

  @PUT(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios/{id}")
  @FormUrlEncoded()
  Future<String> editarComentario(
      @Path("id") String id, @Body() ComentarioDto comentarioDto);

  @DELETE(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/comentarios/{id}")
  @FormUrlEncoded()
  Future<String> deletarComentario(@Path("id") String id);

  // //Parte Serviços das Postagens

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens")
  Future<UtilRetornoPost> listarPostagens();

  @POST("/postagens")
  Future<UtilRetornoPost> cadastrarPostagem(@Body() Postagem postagem);

  @PUT("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens")
  Future<UtilRetornoPostagem> editarPostagem(@Body() Postagem postagem);

  @DELETE(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/{id}")
  @FormUrlEncoded()
  Future<String> excluirPostagem(@Path("id") String id);

  @POST(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/{id}/like")
  @FormUrlEncoded()
  Future<String> darLike(@Path("id") String id);

  @POST("/postagens/{id}/like")
  @FormUrlEncoded()
  Future<String> removerLike(@Path("id") String id);

  @GET(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/{idPost}")
  @FormUrlEncoded()
  Future<UtilRetornoPost> buscarPost(@Path("idPost") String idPost);

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/postagens")
  Future<List<Postagem>> listarPostagensSeguindo();

  @GET(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/postagens/meuUsuario")
  Future<UtilRetornoPostagens> listarMinhasPostagens();

  @GET("/postagens/postagemUsuario")
  Future<UtilRetornoPostagens> listarPostagensDeUmUsuario();

  // //Parte Serviços Seguindo

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/seguindo")
  Future<UtilRetornoUsers> listarSeguidores(); //quem eu sigo

  @POST(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/seguindo/{id}")
  @FormUrlEncoded()
  Future<String> seguirUsuario(@Path("id") int id);

  @POST(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/seguindo/{id}")
  @FormUrlEncoded()
  Future<String> unFollowUser(@Path("id") int id);

  @POST(
      "https://app.pactosolucoes.com.br/socialmedia-api/usuarios/seguindo​/seguidores")
  Future<UtilRetornoUsers> listarMeusSeguidores();

  // //Parte Serviços do Usuário

  @GET("https://app.pactosolucoes.com.br/socialmedia-api/usuarios/usuarios")
  Future<UtilRetornoUsuario> filtrarUsuarios(@Query("nome") String nome);

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
