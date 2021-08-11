import 'dart:convert';

import 'package:miniBlog/entidades/Usuario.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'ControladorUsuario.g.dart';

class ControladorUsuario = _ControladorUsuarioBase with _$ControladorUsuario;

abstract class _ControladorUsuarioBase with Store {
  Usuario usuarioLogado = new Usuario();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void usuarioExiste({Function existe, Function naoExiste}) {
    _prefs.then((prefsDb) {
      String usuarioJson = prefsDb.getString("user");
      if (usuarioJson != null) {
        usuarioLogado = Usuario.fromJson(JsonCodec().decode(usuarioJson));
        existe?.call();
      } else {
        naoExiste?.call();
      }
    });
  }
}
