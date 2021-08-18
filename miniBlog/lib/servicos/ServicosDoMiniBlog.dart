import 'package:miniBlog/entidades/Comentario.dart';
import 'package:miniBlog/entidades/ComentarioDto.dart';
import 'package:miniBlog/entidades/Post.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/entidades/Postagem.dart';
import 'package:miniBlog/util/UtilRetorno.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ServicosDoMiniBlog.g.dart';

@RestApi(baseUrl: "app.pactosolucoes.com.br")
abstract class ServicosDoMiniBlog {
  factory ServicosDoMiniBlog(Dio dio, {String baseUrl}) = _ServicosDoMiniBlog;

  //Autenticação

  @POST("/socialmedia-api/authenticate")
  Future<UtilRetornoUsuario> autenticarUsuario(@Body() Usuario usuario);

  //Parte Serviços dos Comentários

  @GET("/socialmedia-api​/comentarios")
  Future<UtilRetornoComentarios> listarComentariosPostagem(
      @Body() String idPostagem);

  @POST("/socialmedia-api​/comentarios")
  Future<String> cadastrarComentario(@Body() ComentarioDto comentarioDto);

  @GET("/socialmedia-api/comentarios/{id}")
  @FormUrlEncoded()
  Future<Comentario> buscarComentario(@Path("id") String id);

  @PUT("/socialmedia-api/comentarios/{id}")
  @FormUrlEncoded()
  Future<String> editarComentario(
      @Path("id") String id, @Body() ComentarioDto comentarioDto);

  @DELETE("/socialmedia-api/comentarios/{id}")
  @FormUrlEncoded()
  Future<String> deletarComentario(@Path("id") String id);

  //Parte Serviços das Postagens

  @GET("/socialmedia-api/postagens")
  Future<UtilRetornoPost> listarPostagens();

  @POST("/socialmedia-api/postagens")
  Future<UtilRetornoPost> cadastrarPostagem(@Body() Post postagem);

  @PUT("/socialmedia-api/postagens")
  Future<UtilRetornoPostagem> editarPostagem(@Body() Postagem postagem);

  @DELETE("/socialmedia-api/postagens/{id}")
  @FormUrlEncoded()
  Future<String> excluirPostagem(@Path("id") String id);

  @POST("/socialmedia-api/postagens/{id}/like")
  @FormUrlEncoded()
  Future<String> darLike(@Path("id") String id);

  @POST("/socialmedia-api/postagens/{id}/like")
  @FormUrlEncoded()
  Future<String> removerLike(@Path("id") String id);

  @GET("/socialmedia-api/postagens/{idPost}")
  @FormUrlEncoded()
  Future<UtilRetornoPost> buscarPost(@Path("idPost") String idPost);

  @GET("/socialmedia-api/postagens/listaPost")
  Future<UtilRetornoPostagens> listarPostagensSeguindo();

  @GET("/socialmedia-api/postagens/meuUsuario")
  Future<UtilRetornoPostagens> listarMinhasPostagens();

  @GET("/socialmedia-api/postagens/postagemUsuario")
  Future<UtilRetornoPostagens> listarPostagensDeUmUsuario();

  //Parte Serviços Seguindo

  @GET("/socialmedia-api/seguindo")
  Future<UtilRetornoUsers> listarSeguidores(); //quem eu sigo

  @POST("/socialmedia-api/seguindo/{id}")
  @FormUrlEncoded()
  Future<String> seguirUsuario(@Path("id") int id);

  @POST("/socialmedia-api/seguindo/{id}")
  @FormUrlEncoded()
  Future<String> unFollowUser(@Path("id") int id);

  @POST("/socialmedia-api​/seguindo​/seguidores")
  Future<UtilRetornoUsers> listarMeusSeguidores();

  //Parte Serviços do Usuário

  @GET("/socialmedia-api/usuarios")
  Future<UtilRetornoUsuario> filtrarUsuarios(@Query("nome") String nome);

  @POST("/socialmedia-api/usuarios")
  Future<UtilRetornoUsuario> cadastrarUsuario(@Body() Usuario usuario);

  @GET("/socialmedia-api/usuarios/{idUsuario}")
  @FormUrlEncoded()
  Future<UtilRetornoUsuario> buscarUsurio(@Path("idUsuario") int idUsuario);

  @PUT("/socialmedia-api/usuarios/{idUsuario}")
  @FormUrlEncoded()
  Future<UtilRetornoUsuario> editarUsuario(
      @Path("idUsuario") int idUsuario, @Body() Usuario usuario);

  @DELETE("/socialmedia-api/usuarios/{idUsuario}")
  @FormUrlEncoded()
  Future<UtilRetornoUsuario> excluirUsuario(@Path("idUsuario") int idUsuario);
}
