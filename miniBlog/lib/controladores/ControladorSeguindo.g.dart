// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ControladorSeguindo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControladorSeguindo on _ControladorSeguindoBase, Store {
  final _$numeroFollowAtom =
      Atom(name: '_ControladorSeguindoBase.numeroFollow');

  @override
  int get numeroFollow {
    _$numeroFollowAtom.reportRead();
    return super.numeroFollow;
  }

  @override
  set numeroFollow(int value) {
    _$numeroFollowAtom.reportWrite(value, super.numeroFollow, () {
      super.numeroFollow = value;
    });
  }

  final _$numeroFollowersAtom =
      Atom(name: '_ControladorSeguindoBase.numeroFollowers');

  @override
  int get numeroFollowers {
    _$numeroFollowersAtom.reportRead();
    return super.numeroFollowers;
  }

  @override
  set numeroFollowers(int value) {
    _$numeroFollowersAtom.reportWrite(value, super.numeroFollowers, () {
      super.numeroFollowers = value;
    });
  }

  @override
  String toString() {
    return '''
numeroFollow: ${numeroFollow},
numeroFollowers: ${numeroFollowers}
    ''';
  }
}
