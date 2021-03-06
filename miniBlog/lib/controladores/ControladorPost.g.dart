// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ControladorPost.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControladorPost on _ControladorPostBase, Store {
  final _$comentariosAtom = Atom(name: '_ControladorPostBase.comentarios');

  @override
  ObservableList<Comentario> get comentarios {
    _$comentariosAtom.reportRead();
    return super.comentarios;
  }

  @override
  set comentarios(ObservableList<Comentario> value) {
    _$comentariosAtom.reportWrite(value, super.comentarios, () {
      super.comentarios = value;
    });
  }

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

  @override
  String toString() {
    return '''
comentarios: ${comentarios},
postsSeguidos: ${postsSeguidos},
statusConsultaFeed: ${statusConsultaFeed}
    ''';
  }
}
