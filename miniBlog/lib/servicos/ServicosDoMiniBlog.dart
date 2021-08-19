import 'package:miniBlog/entidades/Comentario.dart';
import 'package:miniBlog/entidades/ComentarioDto.dart';
import 'package:miniBlog/entidades/Post.dart';
import 'package:miniBlog/entidades/Usuario.dart';
import 'package:miniBlog/entidades/Postagem.dart';
import 'package:miniBlog/util/UtilRetorno.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ServicosDoMiniBlog.g.dart';

@RestApi(baseUrl: "https://app.pactosolucoes.com.br/socialmedia-api")
abstract class ServicosDoMiniBlog {
  factory ServicosDoMiniBlog(Dio dio, {String baseUrl}) = _ServicosDoMiniBlog;

  //Autenticação

  @POST("/authenticate")
  Future<UtilRetornoUsuario> autenticarUsuario(@Body() Usuario usuario);

  //Parte Serviços dos Comentários

  @GET("/comentarios")
  Future<UtilRetornoComentarios> listarComentariosPostagem(
      @Body() String idPostagem);

  @POST("/comentarios")
  Future<String> cadastrarComentario(@Body() ComentarioDto comentarioDto);

  @GET("/comentarios/{id}")
  @FormUrlEncoded()
  Future<Comentario> buscarComentario(@Path("id") String id);

  @PUT("/comentarios/{id}")
  @FormUrlEncoded()
  Future<String> editarComentario(
      @Path("id") String id, @Body() ComentarioDto comentarioDto);

  @DELETE("/comentarios/{id}")
  @FormUrlEncoded()
  Future<String> deletarComentario(@Path("id") String id);

  //Parte Serviços das Postagens

  @GET("/postagens")
  Future<UtilRetornoPost> listarPostagens();

  @POST("/postagens")
  Future<UtilRetornoPost> cadastrarPostagem(@Body() Post postagem);

  @PUT("/postagens")
  Future<UtilRetornoPostagem> editarPostagem(@Body() Postagem postagem);

  @DELETE("/postagens/{id}")
  @FormUrlEncoded()
  Future<String> excluirPostagem(@Path("id") String id);

  @POST("/postagens/{id}/like")
  @FormUrlEncoded()
  Future<String> darLike(@Path("id") String id);

  @POST("/postagens/{id}/like")
  @FormUrlEncoded()
  Future<String> removerLike(@Path("id") String id);

  @GET("/postagens/{idPost}")
  @FormUrlEncoded()
  Future<UtilRetornoPost> buscarPost(@Path("idPost") String idPost);

  @GET("/postagens/listaPost")
  Future<UtilRetornoPostagens> listarPostagensSeguindo();

  @GET("/postagens/meuUsuario")
  Future<UtilRetornoPostagens> listarMinhasPostagens();

  @GET("/postagens/postagemUsuario")
  Future<UtilRetornoPostagens> listarPostagensDeUmUsuario();

  //Parte Serviços Seguindo

  @GET("/seguindo")
  Future<UtilRetornoUsers> listarSeguidores(); //quem eu sigo

  @POST("/seguindo/{id}")
  @FormUrlEncoded()
  Future<String> seguirUsuario(@Path("id") int id);

  @POST("/seguindo/{id}")
  @FormUrlEncoded()
  Future<String> unFollowUser(@Path("id") int id);

  @POST("/seguindo​/seguidores")
  Future<UtilRetornoUsers> listarMeusSeguidores();

  //Parte Serviços do Usuário

  @GET("/usuarios")
  Future<UtilRetornoUsuario> filtrarUsuarios(@Query("nome") String nome);

  @POST("/usuarios")
  Future<UtilRetornoUsuario> cadastrarUsuario(@Body() Usuario usuario);

  @GET("/usuarios/{idUsuario}")
  @FormUrlEncoded()
  Future<UtilRetornoUsuario> buscarUsurio(@Path("idUsuario") int idUsuario);

  @PUT("/usuarios/{idUsuario}")
  @FormUrlEncoded()
  Future<UtilRetornoUsuario> editarUsuario(
      @Path("idUsuario") int idUsuario, @Body() Usuario usuario);

  @DELETE("/usuarios/{idUsuario}")
  @FormUrlEncoded()
  Future<UtilRetornoUsuario> excluirUsuario(@Path("idUsuario") int idUsuario);
}
