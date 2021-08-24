// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ControladorPost.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControladorPost on _ControladorPostBase, Store {
  final _$postsSeguidosAtom = Atom(name: '_ControladorPostBase.postsSeguidos');

  @override
  ObservableList<Postagem> get postsSeguidos {
    _$postsSeguidosAtom.reportRead();
    return super.postsSeguidos;
  }

  @override
  set postsSeguidos(ObservableList<Postagem> value) {
    _$postsSeguidosAtom.reportWrite(value, super.postsSeguidos, () {
      super.postsSeguidos = value;
    });
  }

  final _$postIdAtom = Atom(name: '_ControladorPostBase.postId');

  @override
  String get postId {
    _$postIdAtom.reportRead();
    return super.postId;
  }

  @override
  set postId(String value) {
    _$postIdAtom.reportWrite(value, super.postId, () {
      super.postId = value;
    });
  }

  final _$comentariosPostAtom =
      Atom(name: '_ControladorPostBase.comentariosPost');

  @override
  ObservableList<Comentario> get comentariosPost {
    _$comentariosPostAtom.reportRead();
    return super.comentariosPost;
  }

  @override
  set comentariosPost(ObservableList<Comentario> value) {
    _$comentariosPostAtom.reportWrite(value, super.comentariosPost, () {
      super.comentariosPost = value;
    });
  }

  final _$statusConsultaFeedAtom =
      Atom(name: '_ControladorPostBase.statusConsultaFeed');

  @override
  StatusConsulta get statusConsultaFeed {
    _$statusConsultaFeedAtom.reportRead();
    return super.statusConsultaFeed;
  }

  @override
  set statusConsultaFeed(StatusConsulta value) {
    _$statusConsultaFeedAtom.reportWrite(value, super.statusConsultaFeed, () {
      super.statusConsultaFeed = value;
    });
  }

  final _$statusConsultaComentarioAtom =
      Atom(name: '_ControladorPostBase.statusConsultaComentario');

  @override
  StatusConsulta get statusConsultaComentario {
    _$statusConsultaComentarioAtom.reportRead();
    return super.statusConsultaComentario;
  }

  @override
  set statusConsultaComentario(StatusConsulta value) {
    _$statusConsultaComentarioAtom
        .reportWrite(value, super.statusConsultaComentario, () {
      super.statusConsultaComentario = value;
    });
  }

  final _$numeroComentariosAtom =
      Atom(name: '_ControladorPostBase.numeroComentarios');

  @override
  int get numeroComentarios {
    _$numeroComentariosAtom.reportRead();
    return super.numeroComentarios;
  }

  @override
  set numeroComentarios(int value) {
    _$numeroComentariosAtom.reportWrite(value, super.numeroComentarios, () {
      super.numeroComentarios = value;
    });
  }

  final _$likedAtom = Atom(name: '_ControladorPostBase.liked');

  @override
  bool get liked {
    _$likedAtom.reportRead();
    return super.liked;
  }

  @override
  set liked(bool value) {
    _$likedAtom.reportWrite(value, super.liked, () {
      super.liked = value;
    });
  }

  final _$_ControladorPostBaseActionController =
      ActionController(name: '_ControladorPostBase');

  @override
  void darLike(String id,
      {dynamic Function() erro, dynamic Function() sucesso}) {
    final _$actionInfo = _$_ControladorPostBaseActionController.startAction(
        name: '_ControladorPostBase.darLike');
    try {
      return super.darLike(id, erro: erro, sucesso: sucesso);
    } finally {
      _$_ControladorPostBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerLike(String id,
      {dynamic Function() erro, dynamic Function() sucesso}) {
    final _$actionInfo = _$_ControladorPostBaseActionController.startAction(
        name: '_ControladorPostBase.removerLike');
    try {
      return super.removerLike(id, erro: erro, sucesso: sucesso);
    } finally {
      _$_ControladorPostBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postsSeguidos: ${postsSeguidos},
postId: ${postId},
comentariosPost: ${comentariosPost},
statusConsultaFeed: ${statusConsultaFeed},
statusConsultaComentario: ${statusConsultaComentario},
numeroComentarios: ${numeroComentarios},
liked: ${liked}
    ''';
  }
}
